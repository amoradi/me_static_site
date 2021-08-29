 #!/bin/sh

zola build
cp -r public/  ../amoradi.github.io/
cd ../amoradi.github.io/
git add .
git commit -m "publish www"
git push origin master

cd ../me_static_site
rm -rf ./public/

echo "Published site in github pages repo!"
