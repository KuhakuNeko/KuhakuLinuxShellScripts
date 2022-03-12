#! /bin/sh
#HyperHakuBench by KuhakuNeko
#mode, pyscript1, pyscript2, repAnsaa, reportName1, reportName2

echo "Welcome to HyperHakuBench by KuhakuNeko (using Hyperfine) please select your optimized mode:"
echo "1. Simple comparison"
echo "2. The standard"
echo "3. The EXTREME bench test"
echo "4. The Kuhaku's bench test"
read mode

echo "Please enter the directory of the 1st python script..."
read pyscript1
echo ""
echo "Please enter the directory of the 2nd python script..."
read pyscript2
echo ""

echo "Want to export markdown report? Y/N"
read repAnsaa

echo ""
echo "Clearing Caches..." 
hyperfine 'sync; echo 3 | sudo tee /proc/sys/vm/drop_caches'
echo ""
echo ""
echo ""
echo ""
echo "Cleared Caches ----> Warming Up" 
echo ""
echo ""
echo ""
echo ""
sleep 2
hyperfine --warmup 3 'grep -R TODO *'
echo ""
echo ""
echo ""
echo ""
sync; echo "Warming Up ----> Benching..."
echo ""
echo ""
echo ""
echo ""
sleep 1

if [ $repAnsaa = "Y" -o $repAnsaa = "y"  ]
then
	reportName1="${pyscript1}_Report"
	reportName2="${pyscript2}_Report"
	if [ $mode = "1" ]
	then
		hyperfine -i --export-markdown "$reportName1" $pyscript1
		hyperfine -i --export-markdown "$reportName2" $pyscript2
	elif [ $mode = "2" ]
	then
		hyperfine -i -w 5 -r 2000 --export-markdown "$reportName1" $pyscript1
		hyperfine -i -w 5 -r 2000 --export-markdown "$reportName2" $pyscript2
	elif [ $mode = "3" ]
	then
		hyperfine -i -w 1000 -r 20000 -s 'full || true' --export-markdown "$reportName1" $pyscript1
		hyperfine -i -w 1000 -r 20000 -s 'full || true' --export-markdown "$reportName2" $pyscript2
	elif [ $mode = "4" ]
	then
		hyperfine -i -r 8000 -s 'full || true' --export-markdown "$reportName1" $pyscript1
		hyperfine -i -r 8000 -s 'full || true' --export-markdown "$reportName2" $pyscript2
	fi
	
	cat $reportName1 $reportName2 > HyperHakuBench_ScriptCompare.txt
	cat -n HyperHakuBench_ScriptCompare.txt | sort -uk2 | sort -nk1 | cut -f2-
	echo""
	echo "Want to remove individual reports? (will keep the concatenated report) Y/N"
	read repAnsaa
	if [ $repAnsaa = "Y" -o $repAnsaa = "y"  ]
	then
		rm -rf $reportName1
		rm -rf $reportName2
		echo "$reportName1 and $reportName2 were deleted."
	fi
	echo""
		
else
	if [ $mode = "1" ]
	then
		hyperfine -i $pyscript1
		hyperfine -i $pyscript2
	elif [ $mode = "2" ]
	then
		hyperfine -i -w 5 -r 2000 $pyscript1
		hyperfine -i -w 5 -r 2000 $pyscript2
	elif [ $mode = "3" ]
	then
		hyperfine -i -w 1000 -r 20000 -s 'full || true' $pyscript1
		hyperfine -i -w 1000 -r 20000 -s 'full || true' $pyscript2
	elif [ $mode = "4" ]
	then
		hyperfine -i -r 8000 -s 'full || true' $pyscript1
		hyperfine -i -r 8000 -s 'full || true' $pyscript2
	fi
fi

echo""
echo "Your Hyperfine version is ⤵️"
hyperfine -V
