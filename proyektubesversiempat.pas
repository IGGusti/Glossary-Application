program tubes;
uses crt;

type data = record
     kata, artikata : string;
end;

var  ketemu : boolean;
     arsip, dokumen, tempat : file of data;
     d : array [1..100] of data;
     w, i, n, pil, o, p, t : integer;
     x, z, k, l, user, pass : string;


procedure menuutama;
forward;

procedure menuuser;
forward;

procedure hapuskata;
  begin
  clrscr;
     writeln('{Hapus kata}');
     writeln;
     assign(arsip, 'saos.dat');
     reset(arsip);
     assign(dokumen, 'selai.dat');
     rewrite(dokumen);
     for i:=1 to filesize(arsip) do
       begin
         read(arsip, d[i]);
         write(dokumen, d[i]);
       end;
     close(arsip);
     close(dokumen);

     assign(dokumen, 'selai.dat');
     reset(dokumen);
     i := 1;
     while not eof(dokumen) do
       begin
         read(dokumen, d[i]);
         writeln(i, '. ', d[i].kata, ' adalah ', d[i].artikata);
         inc(i);
         writeln;
       end;
     w := filesize(dokumen);
     close(dokumen);

     write('Masukkan nomor yang ingin dihapus (1-', w, ') : ');
     readln(t);

     assign(dokumen, 'selai.dat');
     reset(dokumen);
     assign(tempat, 'kuah.dat');
     rewrite(tempat);
     for i:=t+1 to filesize(dokumen) do
       begin
         read(dokumen, d[i+t]);
         write(tempat, d[i]);
       end;
     close(dokumen);
     close(tempat);

     assign(dokumen, 'selai.dat');
     reset(dokumen);
     seek(dokumen, filesize(dokumen)-(w-(t-1)));
     truncate(dokumen);
     reset(dokumen);
     i := 1;
     close(dokumen);

     assign(dokumen, 'selai.dat');
     reset(dokumen);
     assign(tempat, 'kuah.dat');
     reset(tempat);
     assign(arsip, 'saos.dat');
     rewrite(arsip);
     for i:=1 to filesize(dokumen) do
       begin
         read(dokumen, d[i]);
         write(arsip, d[i]);
       end;
     for i:=1 to filesize(tempat) do
       begin
         read(tempat, d[i]);
         write(arsip, d[i]);
       end;
     close(dokumen);
     close(tempat);
     close(arsip);

     while (l<>'Y') or (l<>'y') do
       begin
         writeln;
         write('> Apakah anda ingin menghapus data lagi (Y/N) ? ');
         readln(l);
         if (l='Y') or (l='y') then
           begin
             assign(arsip, 'saos.dat');
             reset(arsip);
             assign(dokumen, 'selai.dat');
             rewrite(dokumen);
             for i:=1 to filesize(arsip) do
               begin
                 read(arsip, d[i]);
                 write(dokumen, d[i]);
               end;
             close(arsip);
             close(dokumen);
             assign(dokumen, 'selai.dat');
             reset(dokumen);
             i := 1;
             while not eof(dokumen) do
               begin
                 read(dokumen, d[i]);
                 writeln(i, '. ', d[i].kata, ' adalah ', d[i].artikata);
                 inc(i);
                 writeln;
               end;
             w := filesize(dokumen);
             close(dokumen);
             write('Masukkan nomor yang ingin dihapus (1-', w, ') : ');
             readln(t);
             assign(dokumen, 'selai.dat');
             reset(dokumen);
             assign(tempat, 'kuah.dat');
             rewrite(tempat);
             for i:=t+1 to filesize(dokumen) do
               begin
                 read(dokumen, d[i+t]);
                 write(tempat, d[i]);
               end;
             close(dokumen);
             close(tempat);
             assign(dokumen, 'selai.dat');
             reset(dokumen);
             seek(dokumen, filesize(dokumen)-(w-(t-1)));
             truncate(dokumen);
             reset(dokumen);
             i := 1;
             close(dokumen);
             assign(dokumen, 'selai.dat');
             reset(dokumen);
             assign(tempat, 'kuah.dat');
             reset(tempat);
             assign(arsip, 'saos.dat');
             rewrite(arsip);
             for i:=1 to filesize(dokumen) do
               begin
                 read(dokumen, d[i]);
                 write(arsip, d[i]);
               end;
             for i:=1 to filesize(tempat) do
               begin
                 read(tempat, d[i]);
                 write(arsip, d[i]);
               end;
             close(dokumen);
             close(tempat);
             close(arsip);
           end
         else
           menuutama;
       end;
  end;

procedure carikatauser;
  begin
  clrscr;
     writeln('{Cari arti kata}');
     writeln;
     write('Masukkan kata : ');
     readln(x);
     writeln;
     assign(arsip, 'saos.dat');
     reset(arsip);
     ketemu := false;
     while (not eof (arsip)) and (not ketemu) do
        begin
           read(arsip, d[i]);
           if(d[i].kata=x) then
              ketemu:=true;
        end;
     if (ketemu) then
         writeln('    ', d[i].kata, ' adalah ', d[i].artikata)
     else
         writeln('# Maaf, kata tidak ditemukan!!!');
     close(arsip);
     while (k<>'Y') or (k<>'y') do
      begin
       writeln;
       write('> Apakah anda ingin mencari kata lagi (Y/N) ? ');
       readln(k);
       if (k='Y') or (k='y') then
         begin
           writeln;
           write('Masukkan kata : ');
           readln(x);
           writeln;
           assign(arsip, 'saos.dat');
           reset(arsip);
           ketemu := false;
           while (not eof (arsip)) and (not ketemu) do
             begin
               read(arsip, d[i]);
               if(d[i].kata=x) then
               ketemu:=true;
             end;
           if (ketemu) then
             writeln('    ', d[i].kata, ' adalah ', d[i].artikata)
           else
           writeln('# Maaf, kata tidak ditemukan!!!');
           close(arsip);
         end
       else
         menuuser;
      end;
  end;

procedure carikata;
  begin
  clrscr;
     writeln('{Cari arti kata}');
     writeln;
     write('Masukkan kata : ');
     readln(x);
     writeln;
     assign(arsip, 'saos.dat');
     reset(arsip);
     ketemu := false;
     while (not eof (arsip)) and (not ketemu) do
        begin
           read(arsip, d[i]);
           if(d[i].kata=x) then
              ketemu:=true;
        end;
     if (ketemu) then
         writeln('    ', d[i].kata, ' adalah ', d[i].artikata)
     else
         writeln('# Maaf, kata tidak ditemukan!!!');
     close(arsip);
     while (k<>'Y') or (k<>'y') do
      begin
       writeln;
       write('> Apakah anda ingin mencari kata lagi (Y/N) ? ');
       readln(k);
       if (k='Y') or (k='y') then
         begin
           writeln;
           write('Masukkan kata : ');
           readln(x);
           writeln;
           assign(arsip, 'saos.dat');
           reset(arsip);
           ketemu := false;
           while (not eof (arsip)) and (not ketemu) do
             begin
               read(arsip, d[i]);
               if(d[i].kata=x) then
               ketemu:=true;
             end;
           if (ketemu) then
             writeln('    ', d[i].kata, ' adalah ', d[i].artikata)
           else
           writeln('# Maaf, kata tidak ditemukan!!!');
           close(arsip);
         end
       else
         menuutama;
      end;
  end;

procedure nambahdata;
  begin
  clrscr;
       writeln('{Tambahkan Data Glosarium}');
       writeln;
       assign(arsip, 'saos.dat');
       reset(arsip);
       seek(arsip, filesize(arsip));
       write('Masukkan banyak data tambahan : ');
       readln(o);
       p := n+1;
       n := n+o;
       for i:=p to n do
          begin
            writeln;
            write('      Kata      : ');
            readln(d[i].kata);
            write('      Arti kata : ');
            readln(d[i].artikata);
            writeln;
            write(arsip, d[i]);
         end;
       close(arsip);
       while (z<>'Y') or (z<>'y') do
         begin
           writeln;
           write('> Apakah anda ingin menambah data tambahan lagi (Y/N) ? ');
           readln(z); writeln;
           if (z='Y') or (z='y') then
             begin
               assign(arsip, 'saos.dat');
               reset(arsip);
               seek(arsip, filesize(arsip));
               write('Masukkan banyak data tambahan : ');
               readln(o);
               p := n+1;
               n := n+o;
               for i:=p to n do
                 begin
                   writeln;
                   write('      Kata      : ');
                   readln(d[i].kata);
                   write('      Arti kata : ');
                   readln(d[i].artikata);
                   writeln;
                   write(arsip, d[i]);
                 end;
               close(arsip);
             end
          else
             menuutama;
        end;
  end;

procedure glosariumuser;
  begin
       clrscr;
       writeln('{Glosarium}');
       writeln('------------------');
       writeln;
       assign(arsip, 'saos.dat');
       reset(arsip);
       i := 1;
       while not eof (arsip) do
          begin
             read(arsip, d[i]);
             writeln(i, '. ', d[i].kata, ' adalah ', d[i].artikata);
             writeln;
             inc(i);
          end;
       close(arsip);
       readln;
       menuuser;
  end;

procedure glosarium;
  begin
       clrscr;
       writeln('{Glosarium}');
       writeln('------------------');
       writeln;
       assign(arsip, 'saos.dat');
       reset(arsip);
       i := 1;
       while not eof (arsip) do
          begin
             read(arsip, d[i]);
             writeln(i, '. ', d[i].kata, ' adalah ', d[i].artikata);
             writeln;
             inc(i);
          end;
       n:=i-1;
       close(arsip);
       readln;
       menuutama;
  end;

procedure datamaster;
  begin
       clrscr;
       assign(arsip, 'saos.dat');
       rewrite(arsip);
       d[1].kata := 'Array';
       d[1].artikata := 'suatu tipe data yang terstruktur dan dapat menyimpan banyak data dengan nama yang sama.'; write(arsip, d[1]);
       d[2].kata := 'Append';
       d[2].artikata := 'sebuah fungsi yang dapat menambahkan data ke dalam file teks.'; write(arsip, d[2]);
       d[3].kata := 'Char';
       d[3].artikata := 'tipe data yang terdiri dari suatu karakter.'; write(arsip, d[3]);
       d[4].kata := 'File bertipe';
       d[4].artikata := 'file yang berisikan dereten yang memiliki tipe data yang sama.'; write(arsip, d[4]);
       d[5].kata := 'Fungsi';
       d[5].artikata := 'sebuah transformasi akibat pemetaan suatu nilai atau nilai lain.'; write(arsip, d[5]);
       d[6].kata := 'Boolean';
       d[6].artikata := 'adalah operasi logika yang hanya akan menghasilkan nilai true atau false.'; write(arsip, d[6]);
       d[7].kata := 'Percabangan';
       d[7].artikata := 'metode pemilihan suatu aksi yang akan dijalankan oleh program.'; write(arsip, d[7]);
       d[8].kata := 'Procedure';
       d[8].artikata := 'sekumpulan algoritma yang di beri nama dan dapat dipanggil untuk mengerjakan sesuatu.'; write(arsip, d[8]);
       d[9].kata := 'Real';
       d[9].artikata := 'tipe data bilangan asli.'; write(arsip, d[9]);
       d[10].kata := 'Searching';
       d[10].artikata := 'sebuah algoritma yang berfunsi untuk mencari suatu data.'; write(arsip, d[10]);
       close(arsip);
       p:=0;
       menuutama;
  end;

procedure menuuser;
   begin
     clrscr;
     writeln('===============');
     writeln('|  Menu User  |');
     writeln('==============='); writeln;
     writeln(' 1. Glosarium');
     writeln(' 2. Cari arti kata');
     writeln(' 0. (EXIT)');
     write('Masukkan pilihan (1/2/0) : ');
     readln(pil);
     while (pil<>1) or (pil<>2) or (pil<>0) do
      begin
       case pil of
          1 : glosariumuser;
          2 : carikatauser;
          0 : halt;
       else
          writeln;
          writeln('# Maaf, anda salah ketik !!!'); writeln;
          write('Masukkan kembali pilihan (1/2/0) : ');
          readln(pil);
       end;
      end;
     readln;
   end;

procedure menuutama;
   begin
     clrscr;
     writeln('================');
     writeln('|  Menu Admin  |');
     writeln('================'); writeln;
     writeln(' 1. Glosarium');
     writeln(' 2. Tambahkan data glosarium');
     writeln(' 3. Cari arti kata');
     writeln(' 4. Hapus kata');
     writeln(' 5. Reset data glosarium ke data master');
     writeln(' 0. (EXIT)');
     write('Masukkan pilihan (1/2/3/4/5/0) : ');
     readln(pil);
     while (pil<>1) or (pil<>2) or (pil<>3) or (pil<>4) or (pil<>5) or (pil<>0) do
      begin
       case pil of
          1 : glosarium;
          2 : nambahdata;
          3 : carikata;
          4 : hapuskata;
          5 : datamaster;
          0 : halt;
       else
          writeln;
          writeln('# Maaf, anda salah ketik !!!'); writeln;
          write('Masukkan kembali pilihan (1/2/3/4/5/0) : ');
          readln(pil);
       end;
      end;
     readln;
   end;

begin
     writeln('===============================================================================');
     writeln('===============================================================================');
     writeln('== |   |   | =  /------ = |     =  /------ =  /----\  = |-     -| =  /------ ==');
     writeln('== |   |   | = |        = |     = |        = |      | = | \   / | = |        ==');
     writeln('== |   |   | = |------  = |     = |        = |      | = |  \ /  | = |------  ==');
     writeln('== |   |   | = |        = |     = |        = |      | = |   |   | = |        ==');
     writeln('== \--/ \--/ =  \------ = \---- =  \------ =  \----/  = |       | =  \------ ==');
     writeln('===============================================================================');
     writeln('===============================================================================');
     writeln;
     writeln('                    TUGAS BESAR LABORATORIUM DASAR KOMPUTER                    ');
     writeln('                                  GLOSARIUM                                    ');
     writeln;
     writeln;
     writeln;
     writeln;
     write(' ~ Username : ');
     readln(user);
     while ((user<>'User') and (user<>'user') and (user<>'Admin') and (user<>'admin')) do
       begin
         clrscr;
                writeln('===============================================================================');
                writeln('===============================================================================');
                writeln('== |   |   | =  /------ = |     =  /------ =  /----\  = |-     -| =  /------ ==');
                writeln('== |   |   | = |        = |     = |        = |      | = | \   / | = |        ==');
                writeln('== |   |   | = |------  = |     = |        = |      | = |  \ /  | = |------  ==');
                writeln('== |   |   | = |        = |     = |        = |      | = |   |   | = |        ==');
                writeln('== \--/ \--/ =  \------ = \---- =  \------ =  \----/  = |       | =  \------ ==');
                writeln('===============================================================================');
                writeln('===============================================================================');
                writeln;
                writeln('                    TUGAS BESAR LABORATORIUM DASAR KOMPUTER                    ');
                writeln('                                  GLOSARIUM                                    ');
                writeln;
                writeln;
                writeln;
                writeln('# Maaf, anda salah username!!!');
                writeln;
                write(' ~ Username : ');
                readln(user);
       end;

     if (user='User') or (user='user') then
        begin
          n:=10;
          writeln;
          writeln('                                                               press ENTER');
          readln;
          menuuser;
        end
     else
          begin
             write(' ~ Password : ');
             readln(pass);
             while ((pass<>'Admin') and (pass<>'admin')) do
              begin
                clrscr;
                writeln('===============================================================================');
                writeln('===============================================================================');
                writeln('== |   |   | =  /------ = |     =  /------ =  /----\  = |-     -| =  /------ ==');
                writeln('== |   |   | = |        = |     = |        = |      | = | \   / | = |        ==');
                writeln('== |   |   | = |------  = |     = |        = |      | = |  \ /  | = |------  ==');
                writeln('== |   |   | = |        = |     = |        = |      | = |   |   | = |        ==');
                writeln('== \--/ \--/ =  \------ = \---- =  \------ =  \----/  = |       | =  \------ ==');
                writeln('===============================================================================');
                writeln('===============================================================================');
                writeln;
                writeln('                    TUGAS BESAR LABORATORIUM DASAR KOMPUTER                    ');
                writeln('                                  GLOSARIUM                                    ');
                writeln;
                writeln;
                writeln;
                writeln('# Maaf, anda salah password!!!');
                writeln;
                writeln(' ~ Username : ', user);
                write(' ~ password : ');
                readln(pass);
              end;
             writeln;
             writeln('                                                               press ENTER');
             readln;
             n:=10;
             menuutama;
          end;
end.
