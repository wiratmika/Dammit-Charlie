disp('KITA PASTI LULUS');

function yi = f(ti)
  yi = e ^ (ti ^ 2);
end

function result = generateY(input)
  result = [];
  for elm = input
    result = [result f(elm)];
  end
end

function result = calculateWithLagrange(x, y, newX)
  n = length(x);
  result = [];

  for i = 1 : length(newX)
    t = newX(i);
    sum = 0;

    for j = 1 : n
      lagrangeBase = 1;
      tj = x(j);

      for k = 1 : n
        if j ~= k
          lagrangeBase = lagrangeBase * (t - x(k));
        end
      end

      for k = 1 : n
        if j ~= k
          lagrangeBase = lagrangeBase / (tj - x(k));
        end
      end

      sum = sum + y(j) * lagrangeBase;
    end
    result = [result sum];
  end
end

function a = getNewtonBase(x, y)
  n = length(x);
  a(1) = y(1);

  for k = 1 : n - 1
    d(k, 1) = (y(k + 1) - y(k)) / (x(k + 1) - x(k));
  end

  for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k + 1, j - 1) - d(k, j - 1)) / (x(k + j) - x(k));
   end
  end

  for j = 2 : n
   a(j) = d(1, j-1);
  end
end

function result = calculateWithNewton(x, y, newX)
  a = getNewtonBase(x, y);
  n = length(x);
  result = [];

  for i = 1 : length(newX)
    t = newX(i);
    sum = a(1);

    for j = 2 : n
      multiply = 1;
      for k = 1 : j - 1
        multiply = multiply * (t - x(k));
      end

      sum = sum + a(j) * multiply;
    end
    result = [result sum];
  end
end

% Soal yang diminta
x = [-2 -1 0 1 2];
y = generateY(x);

% Contoh yang di kitab Chan
% x = [-1 0 2];
% y = [3 -1 0];

% y
xPlot = -10:0.1:10;
% Mari-mari dipilih
% plot(xPlot, calculateWithLagrange(x, y, xPlot));
% plot(xPlot, calculateWithNewton(x, y, xPlot));
% calculateWithLagrange(x, y, x)
% calculateWithNewton(x, y, x)
disp('WOW MEREKA SEMUA HASILNYA SAMA');
