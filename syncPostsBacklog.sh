#rsync /sdcard/workspace/tbeckenhauer.github.io/_postBacklog/ _postBacklog/ -r

SECONDS=3
while   true;
do      sleep "$((10-(SECONDS%10)))"
	rsync /sdcard/workspace/tbeckenhauer.github.io/_postsBacklog/ _postsBacklog/ -r
	rsync /sdcard/workspace/tbeckenhauer.github.io/_posts/ _posts/ -r
done

