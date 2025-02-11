# Sign Language Recognition using CNNs

## Overview
This project implements a Convolutional Neural Network (CNN) to recognize American Sign Language (ASL) letters. The model is trained to classify 24 hand gestures representing the English alphabet, excluding 'J' and 'Z' due to their motion-based nature.

## Dataset
The dataset was sourced from Kaggle and consists of:
- 72,000 images (3,000 images per letter)
- Image size: 200x200 pixels
- 3 color channels (RGB)

Data split:
- 70% Training
- 30% Validation

## Model Architecture
The CNN model consists of:
1. Input layer: 200x200x3
2. Four convolutional layers with pooling
3. Fully connected layers
4. Output layer with 24 classifications

Optimization:
- **Algorithm:** Stochastic Gradient Descent with Momentum (SGDM)
- **Loss Function:** Cross-entropy

## Installation & Requirements
To run this project, ensure you have the following installed:
- MATLAB (for training and evaluation)
- Deep Learning Toolbox

## Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/isaacmenchaca97/lenguaje-senas-CNN.git
   cd lenguaje-senas-CNN
   ```
2. Open `ProyectoFinal.m` in MATLAB.
3. Run the script to train and test the CNN model.

## Results
- The trained model achieves 95.33% accuracy in recognizing static ASL hand gestures.
- Performance details are documented in `ProyectoFinal.pdf`.

## Future Improvements
- Extend the model to recognize dynamic gestures ('J' and 'Z').
- Implement real-time detection using OpenCV and TensorFlow.

## License
This project is open-source and available under the MIT License.

## Acknowledgments
- Dataset from Kaggle
- Inspired by various deep learning approaches in sign language recognition


![Screen Shot 2021-08-09 at 11 12 33](https://user-images.githubusercontent.com/67990891/218847064-22bf0d54-66f3-4c0c-a461-5f0f107eb30d.png)

