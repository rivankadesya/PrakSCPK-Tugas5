namaKaryawan = {'Anton' 'Budi' 'Charles' 'Denny'};
data = [ 0 2 5
         1 2 2
         2 2 3
         3 3 2];
     
maksTerlambatKerja = 30;
maksTidakMasukKerja = 30;
maksMerusakBarang = 10;
data(:,1) = data(:,1) / maksTerlambatKerja;
data(:,2) = data(:,2) / maksTidakMasukKerja;
data(:,3) = data(:,3) / maksMerusakBarang;
relasiAntarKriteria = [ 1     2     2
                        0     1     4
                        0     0     1];
                      
TFN = {[-100/3 0     100/3]     [3/100  0     -3/100]
       [0      100/3 200/3]     [3/200  3/100 0     ]
       [100/3  200/3 300/3]     [3/300  3/200 3/100 ]
       [200/3  300/3 400/3]     [3/400  3/300 3/200 ]};
   [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
   
if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);    

    % Hitung nilai skor akhir 
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan Gajii Karyawan')
    disp('Nama Karyawan, Skor Akhir, Gaji')
end


for i = 1:size(ahp, 1)
        if ahp(i) < 0.04
            status = 'Rp. 3.000.000';
        elseif ahp(i) < 0.052
            status = 'Rp. 2.750.000';
        elseif ahp(i) < 0.07
            status = 'Rp. 2.500.000';
        else
            status = 'Rp. 2.250.000';
        end
        
        disp([char(namaKaryawan(i)), blanks(13 - cellfun('length',namaKaryawan(i))), ', ', ... 
             num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
             char(status)])
end
