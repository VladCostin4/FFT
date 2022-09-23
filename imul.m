function C = imul(nume)
  input = strcat(nume, '.in');
  
  [fin, err] = fopen(input, "r"); # deschidem fisierul de input

	if fin == -1 # verificam daca a fost deschis cu succes
		disp(err);
	endif

	N = fscanf(fin, "%d", 1); # citim gradul polinomului A
	M = fscanf(fin, "%d", 1); # citim gradul polinomului B
  
  S = N + M - 1; # gradul polinomului A * B = C
  S2 = greater2(S); # cea mai mica putere a lui 2 > decat gradul polinomului C

  A = zeros(1, S2); 
  B = zeros(1, S2);

  for i = 1:N # citim A
    A(1, i) = fscanf(fin, "%d", 1);
  endfor
  
  for j = 1:M # citim B
    B(1, j) = fscanf(fin, "%d", 1);
  endfor
  
  A = complex(A); # le transformam in numere complexe
  B = complex(B);

  alpha = -2 * pi / S2;
  w = complex(cos(alpha), sin(alpha)); # cream radacina unitatii

  AF = FFT(A, S2, w); # aplicam fft pe fiecare polinom
  BF = FFT(B, S2, w);

  CF = zeros(1, S2); # cream sirul de puncte pentru polinomul C

  for i = 1:S2 # ca fiind CF = AF * BF
    CF(1, i) = AF(1, i) * BF(1, i); 
  endfor

  C = FFT(CF, S2, w ^ -1); # aplicam fft^-1 pe CF si aflam polinomul final

  output = strcat(nume, '.out');
  
  [fout, err] = fopen(output, "w"); # deschidem fisierul de output

	if fout == -1 # verificam daca a fost deschis cu succes
		disp(err);
	endif

  for i = S:-1:1 # afisam polinomul obtinut
    coef = real(C(1, i)) / S2;

    if coef > 0 && i != S
      fprintf(fout, "+");
    endif

    if coef != 1 || i == 1
      fprintf(fout, "%d", coef);
    endif

    if i > 2
      fprintf(fout, "x^%d", i-1);
    elseif i == 2
      fprintf(fout, "x" );
    endif
  endfor

  fclose(fin);
  fclose(fout);
endfunction