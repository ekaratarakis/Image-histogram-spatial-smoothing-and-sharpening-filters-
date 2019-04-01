# Image-histogram-spatial-smoothing-and-sharpening-filters-
1. Search for an image with bad contrast and 
   - Create a script in Matlab which will build the histogram of the image.
   - Equalize the histogram and represent it together with the new equalized image.
   - Convert the initial image into black and white using some threshold.
2. Now, using the image "brain.gif"
   - Define k1 - scalar number.
   - Define **k2 = k1 + 3** if k1 = even number or **k2 = k1 + 2** if k1 = odd number.
   - Implement to the initial image, two median filters, one of size [k1 k1] and one of size [k2 k2].
   - Implement to the initial image, two gaussian filters, one of size [k1 k1] and one of size [k2 k2].
   - Print the image before and after the implementation of each filter and see the difference.
3. We keep working with the image "brain.gif" and 
   - Implement to the initial image, "salt and pepper" with variance of our choice.
   - Try to reduce the noise effect to the image by using the filters, median of size [k1 k1], median of size [k1 k1], average of size [k1 k1] and average [k2 k2].
   - Print the image before and after the implementation of each filter and see the difference.
