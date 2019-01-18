exim -bpru | awk {'print $3'} | xargs exim -Mrm
