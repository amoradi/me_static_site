 #!/bin/sh

 cp -r public/  ../amoradi.github.io/
 cd ../amoradi.github.io/
 git add .
 git commit -m "publish www"
 git push origin master

 echo "Published site in github pages repo!"
