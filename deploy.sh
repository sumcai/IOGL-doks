# 确保脚本抛出遇到的错误
set -e

git add -A
git commit -m "deploy blog"

githubOriUrl=git@github.com:sumcai/IOGL-doks.git
githubUrl=git@138.2.49.65:/home/git/IOGL-doks/blog.git

git push $githubOriUrl master # 推送到主分支

# 生成静态文件
npm run build

# 进入生成的文件夹
cd public
#echo 'http://www.iogl.cn' > CNAME
git init
git add -A
git commit -m "deploy"
git push -f $githubUrl master # 推送到github gh-pages分支

# git push $githubUrl `git subtree split --prefix=docs/.vuepress/dist master`:master --force # 强制推送
# git subtree push --prefix=docs/.vuepress/dist $githubUrl master # 将静态网页推送到github.io

# 进入生成的文件夹
# cd docs/.vuepress/dist
# echo 'blog.chgtaxihe.top' > CNAME
# deploy to github
# if [ -z "$GITHUB_TOKEN" ]; then
#   msg='deploy'
#   githubUrl=git@github.com:sumcai/sumcai.github.io.git
# else
#   msg='来自github actions的自动部署'
#   githubUrl=https://sumcai:${GITHUB_TOKEN}@github.com/sumcai/sumcai.github.io.git
#   git config --global user.name "sumcai"
#   git config --global user.email "sumcai@163.com"
# fi
# git init
# git add -A
# git commit -m "${msg}"
# git push -f $githubUrl master:gh-pages # 推送到github
# 
# rm -rf docs/.vuepress/dist
