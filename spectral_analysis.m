% Spectral Analysis of Simulated Star Data
% Author: Melisnur Çürük
% Description: This script simulates spectral data and identifies the H-alpha line
%              to calculate the radial velocity of a star.

%% Data Generation (Simulated)
lambdaStart = 630.02;         % Starting wavelength (nm)
lambdaDelta = 0.14;           % Wavelength increment (nm)
nObs = 100;                   % Number of observations

% Generate wavelength vector
lambda = lambdaStart + (0:nObs-1)*lambdaDelta;

% Simulate spectral intensity data (Gaussian dip at H-alpha line)
s = exp(-((lambda - 656.28).^2) / 2);  % Simulated spectral data

% Combine into spectra matrix
spectra = [lambda', s'];

%% Task 1: Define wavelength range
nObs = size(spectra, 1);
lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta;
lambda = (lambdaStart:lambdaDelta:lambdaEnd);

%% Task 2 & 7: Extract intensity values
s = spectra(:, 2);

%% Task 3: Plot spectrum
figure
plot(lambda, s, '.-')
xlabel("Wavelength (nm)")
ylabel("Intensity")
title("Simulated Stellar Spectrum")

%% Task 4: Find H-alpha absorption line
[sHa, idx] = min(s);          % Minimum intensity
lambdaHa = lambda(idx);       % Corresponding wavelength

%% Task 5: Highlight H-alpha line on plot
hold on
plot(lambdaHa, sHa, 'rs', 'MarkerSize', 8)
legend("Spectrum", "H-alpha Line")
hold off

%% Task 6: Calculate radial velocity
z = lambdaHa / 656.28 - 1;    % Redshift
speed = z * 299792.458;       % Speed in km/s

%% Display results
fprintf("Observed H-alpha wavelength: %.2f nm\n", lambdaHa);
fprintf("Radial velocity: %.2f km/s\n", speed);
