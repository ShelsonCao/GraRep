function R = GetRepUseSVD(probTranMat, d, alpha)

[U, S, V] = svd(probTranMat);

Ud = U(:,1:d);
Sd = S(1:d,1:d);
R = Ud * Sd^(alpha);

end