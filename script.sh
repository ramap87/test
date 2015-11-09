file2="/test/test/svn"
file1="/test/test/mso"
ls $file1

for j in `ls $file1`; do
                if [ -f "$file2/$j" ]
                then
                                echo "$file2/$j found."
                                #$temp = grep -nr \"fields\" "$file2/$j" | head -1 | cut -d : -f 1
								#grep -nr '\<fields\>' Account.object | head -1 | cut -d : -f 1
                                #location=$(grep -nr "<fields>" "$file2/$j" | head -1 | cut -d : -f 1)
								location=$(grep -nr '\<fields\>' "$file2/$j" | head -1 | cut -d : -f 1)
                                echo $location
                                #echo "line number  of file2 $location"
                                sed -i '/<fields>/, /<\/fields>/ d ' "$file2/$j"
								value=`sed -nu '/<fields/,/<\/fields/p' "$file1/$j"` > newobj.object
								cat newobj.object
								#echo $value >> newobj.object
								sed -i ''$location'r newobj.object' "$file2/$j"
								rm -rf newobj.object
                               echo $j
                fi
done