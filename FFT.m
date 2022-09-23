function F = FFT(A, m, w)
  if m == 1
    F = A(1, 1);
  else
    Ae = A(1:2:end);
    Ao = A(2:2:end);

    Fe = FFT(Ae, m / 2, w * w);
    Fo = FFT(Ao, m / 2, w * w);

    w0 = 1;

    F = zeros(1, m);

    for i = 1:m/2
      F(1, i) = Fe(1, i) + w0 * Fo(1, i);
      F(1, i + m/2) = Fe(1, i) - w0 * Fo(1, i);

      w0 *= w;
    endfor
  endif %comment
endfunction