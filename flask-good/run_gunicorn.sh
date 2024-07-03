pkill gunicorn
sleep 1
cd /home/ytm/myscripts
nohup /home/ytm/.local/bin/gunicorn -b 127.0.0.1:8001 -w 1 key:app > /dev/null 2>&1 &
