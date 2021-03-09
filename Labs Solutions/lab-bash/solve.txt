#!/bin/bash
ls
echo "Hello World"
mkdir new_dir
rm -rf new_dir
cp lorem/sed.txt lorem-copy/sed.txt
cp lorem/*!(sed.text) lorem-copy/
cat lorem/sed.txt
cat lorem/{at.txt,lorem.txt}
head -3 lorem-copy/sed.txt
tail -3 lorem-copy/sed.txt
echo "Homo homini lupus." >> lorem-copy/sed.txt
tail -3 lorem-copy/sed.txt
sed -i 's/et/ET/g' lorem-copy/at.txt
whoami
pwd
ls lorem/*.txt
wc -l lorem/sed.txt
find -name "lorem*" -type f | wc -l
grep "et" lorem/at.txt
echo "Al anterior podrías añadirle -i para que no haga distinción entre mayúscula y minúsculas y te cuenta 1 más"
grep -o "et" lorem/at.txt | wc -l
grep -o "et" lorem/* | wc -l


NAME="alfonso"
echo $NAME
mkdir $NAME
rm -rf $NAME
for FILE in $(ls lorem); do echo -n $FILE | wc -c; done
