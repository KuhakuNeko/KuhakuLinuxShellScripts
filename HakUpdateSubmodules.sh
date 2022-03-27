#! /bin/sh
#HakUpdateSubmodules by KuhakuNeko
#GitName GitDir GitSubDir GitBranch

#User Inputs
echo "Enter the your git username (E.g. KuhakuNeko):"
read GitName
echo ""
echo "Enter the git directory name of the project you want to update the submodules bellow (E.g. KuhakuNekoLinuxShellScripts):"
read GitDir
echo ""
echo "Enter the git directory name of your forked submodule (E.g. KuhakuNekoLinuxShellScripts_SUB):"
read GitSubDir
echo ""
echo "Enter the branch you want to push the changes to (E.g. master):"
read GitBranch
echo ""

#Work Done
echo "Starting the submodule update process..."
echo ""
echo ""
git clone https://github.com/$GitName/$GitDir
cd ./$GitDir
git rm --cached $GitSubDir
rm -rf $GitSubDir
git submodule add https://github.com/$GitName/$GitSubDir
git add .
git commit -m "Updated Submodule "$GitSubDir" (via HakUpdateSubmodules.sh by KuhakuNeko)"
echo ""
echo ""
echo "Git status message:"
echo ""
git status
echo ""
echo ""
git commit
git push origin $Git
echo ""
echo ""
echo ""
echo ""
echo "Thank you for using HakUpdateSubmodules by KuhakuNeko!"