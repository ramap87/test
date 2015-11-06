file2="C:/testscript/svnrel"
file1="C:/testscript/mso"


for i in `ls $file1`; do 
                if [ -f "$file2/$i" ]
                then
                                echo "$file2/$i found."
                                #$temp = grep -nr \"fields\" "$file2/$i" | head -1 | cut -d : -f 1
                                location=$(grep -nr "<fields>" "$file2/$i" | head -1 | cut -d : -f 1)
                                echo $location
                                #echo "line number  of file2 $location"
                                sed -ie '/<fields>/, /<\/fields>/ d ' "$file2/$i"
                    value=`sed -n '/<fields/,/<\/fields/p' "$file1/$i"`
                                #sed -i ''"$location"'i ${value}' "$file2/$i"
                                #sed -i ' "$location"i \"$value"\ ' "$file2/$i"
                                
                fi 
done
