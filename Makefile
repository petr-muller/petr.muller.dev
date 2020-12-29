deploy:
	git push
	git -C themes/hugo-split-theme fetch origin
	git -C themes/hugo-split-theme rebase origin/master
	rm -rf public
	hugo
	scp -r public/* ansible@eldraine:sites/petr.muller.dev/
	ssh eldraine -l ansible chgrp -R nginx sites/petr.muller.dev/
