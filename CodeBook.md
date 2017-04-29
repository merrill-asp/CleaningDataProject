# Personal Motion Data

## Code Book

Adapted from the UCI HAR Dataset README:

The features selected for this database come from accelerometer and gyroscope 3-axial raw signals produced by a Samsung Galaxy II smartphone while subjects were wearing the smartphone on the waist during various activities. These time domain signals were captured at a constant rate of 50 Hz in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (accelerometer-xyz and gravity-xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The 66 kinematic variables are the means and standard deviations of 33 kinematic features that have been normalized on a scale from -1.0 to 1.0 (and are therefore unitless).

Variables here labeled "xyz" represent three variables, for example "jerk-x", "jerk-y", and "jerk-z":
- "accelerometer-xyz": The accelerometer signal of the body in each of the three coordinate axes
- "gravity-xyz": The component of the 3-axial accelerometer signal that can be attributed to gravity
- "jerk-xyz": The time derivative of the 3-axial accelerometer signal
- "gyroscope-xyz": The gyroscope signal in each of the three coordinate axes
- "gyroscopejerk-xyz": The time derivative of the 3-axial gyroscope signal
- "accelerometermagnitude": The magnitude (via the Euclidean norm) of the accelerometer signal of the body
- "gravitymagnitude": The magnitude of the accelerometer signal that can be attributed to gravity
- "jerkmagnitude": The magnitude of the accelerometer jerk signal
- "gyroscopemagnitude": The magnitude of the gyroscope signal
- "gyroscopejerkmagnitude": The magnitude of the gyroscope jerk signal
- "accelerometerfrequency-xyz": The accelerometer signal of the body transformed to the frequency domain via Fast Fourier Transform (FFT)
- "jerkfrequency-xyz": The accelerometer jerk signal of the body in the frequency domain
- "gyroscopefrequency-xyz": The gyroscope signal in the frequency domain
- "accelerometermagnitudefrequency": The magnitude of the accelerometer signal of the body in the frequency domain
- "jerkmagnitudefrequency": The magnitude of the accelerometer jerk signal in the frequency domain
- "gyroscopemagnitudefrequency": The magnitude of the gyroscope signal in the frequency domain
- "gryoscopejerkmagnitudefrequency": The magnitude of the gyroscope jerk signal in the frequency domain

In addition to the kinematic variables, two other variables are used to specify the subject and their activity during data collection. The activities were identified by manually matching data time stamps to a video taken of each subject.

- "subject": A number from 1 to 30 identifying which subject the data corresponds to
- "activity": One of six activities "walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", or "laying"
