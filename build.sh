rm -rf out
mkdir -p out

cd sbc1
for f in $(find . -name '*.s'); do
  base="${f%.*}"
  ca65 -g $f -o ../out/${base}.o -l ../out/${base}.lst --list-bytes 0
  ld65 -o ../out/${base}.bin -Ln ../out/${base}.labels -m ../out/${base}.map -C system.cfg ../out/${base}.o
done
