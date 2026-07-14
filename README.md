# EEG Motor Imagery Classification (BCI Competition I, Dataset III)

Undergrad internship project at K. N. Toosi University of Technology, Tehran,
Iran, Summer 2021.

MATLAB project from a bachelor's internship on classifying left- vs. right-hand
motor imagery from EEG signals. The project explores a progression of feature
engineering strategies (signal energy → 98 handcrafted statistical/spectral
features → 465 band-specific features) paired with several classic machine
learning classifiers (SVM, LDA, KNN, Naive Bayes), with and without PCA
dimensionality reduction.

## Dataset

The data is the **Graz BCI Competition I — Dataset III** (provided by the
Department of Medical Informatics, Institute for Biomedical Engineering,
Graz University of Technology). A single subject performed 280 trials of
imagined left/right hand movement, 9 seconds each, recorded from 3 bipolar
EEG channels (C3, Cz, C4) sampled at 128 Hz. 140 trials are used for
training and 140 for testing.

Files (in `data/`):
- `dataset_BCIcomp1.mat` — raw EEG signals (`x_train`, `y_train`, `x_test`)
- `labels_data_set_iii.mat` — test labels (`y_test`)

## Approach

The classification pipeline slides a 256-sample (2s) window across each
9-second trial (897 window positions per trial) and, for every window,
extracts features, trains a classifier on the 140 training trials, and
evaluates accuracy on the 140 test trials plus a leave-one-out cross
validation (LOOCV) score on the training set. This produces an
accuracy-over-time curve showing when in the trial the two classes become
separable — as expected, accuracy is near chance (~50%) for the first ~3
seconds (before the movement cue appears) and peaks a couple of seconds
after the cue.

### Phase 1 — Energy baseline (`phase1_energy_baseline/`)

Only the signal energy of each 256-sample window (per channel) is used as
the feature (3 features per window). Classifiers compared: Linear SVM, SVM
with RBF kernel, LDA, KNN (K = 1, 3, 5, 7), Naive Bayes.

| Classifier | Best accuracy |
|---|---|
| **Linear SVM** | **85.0%** |
| SVM (RBF kernel) | 84.3% |
| LDA | 83.6% |
| Naive Bayes | 82.1% |
| KNN (K=1) | 82.9% |
| KNN (K=3, 7) | 82.1% |
| KNN (K=5) | 81.4% |

### Phase 2 — Handcrafted features (`phase2_handcrafted_features/`)

36 additional statistical/spectral features per channel (98 features total
per window) are computed per window: signal energy, skewness, kurtosis,
Shannon entropy, autoregressive (Burg) coefficients, power spectral density
statistics, and wavelet decomposition (db9) coefficient statistics
(mean, energy, std, skewness, kurtosis), plus magnitude-squared coherence
between channels.

Without PCA:

| Classifier | Best accuracy |
|---|---|
| **Linear SVM** | **87.1%** |
| Naive Bayes | 85.7% |
| KNN (K=1, 7) | 85.7% |
| KNN (K=3, 5) | 85.0% |
| LDA | 77.9% |
| SVM (RBF kernel) | 70.7% |

### Phase 2 — With PCA (`phase2_pca/`)

Same 98 features, reduced with PCA keeping components covering 95% of the
variance before classification:

| Classifier | Best accuracy |
|---|---|
| **LDA** | **86.4%** |
| Naive Bayes | 85.7% |
| Linear SVM | 85.7% |
| KNN (K=3, 7) | 84.3% |
| KNN (K=5) | 82.9% |
| KNN (K=1) | 82.1% |
| SVM (RBF kernel) | 75.7% |

### Final phase — Frequency-band features

A later stage of the project (not included in this repo as separate code,
see note below) fixed the best-performing window from Phase 2 and computed
31 features per channel across 5 EEG frequency bands (delta, theta, alpha,
beta, gamma — 465 features total), classified with an SVM (RBF kernel):

| Configuration | Accuracy |
|---|---|
| All 5 bands, no PCA | 84.3% |
| All 5 bands, with PCA (95% variance) | 79.3% |
| Beta band only, no PCA | 73.6% |
| Beta band only, with PCA | 74.3% |

*Note: the frequency-band feature extraction code for this final phase was
embedded directly in the project report rather than kept as a standalone
script, so it isn't included here as a separate `.m` file.*

## Key takeaway

A simple linear SVM on a moderate, hand-engineered feature set (Phase 2,
no PCA) gave the best overall accuracy (87.1%), outperforming both the
minimal energy-only baseline and the higher-dimensional frequency-band
features. PCA helped the classifiers that otherwise struggled with the
full feature dimensionality (e.g., LDA improved from 77.9% → 86.4%) but
slightly hurt the classifiers that were already performing well.

## Requirements

MATLAB with the Signal Processing Toolbox, Statistics and Machine Learning
Toolbox, and Wavelet Toolbox (for `arburg`, `pburg`, `wavedec`, `wentropy`,
`fitcsvm`, `fitcdiscr`, `fitcknn`, `fitcnb`, `pca`).

## Notes

- Some scripts contain hardcoded local file paths from the original
  development machine (e.g. `C:\Users\MATIN\Desktop\Mat`) — update the
  `folder` variable in `Data.m` to point at the `data/` folder in this repo
  before running.
