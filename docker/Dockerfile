from selenium/standalone-chrome:87.0


# python --> python3 linkki
#RUN sudo rm /usr/bin/python \
#&& ln -s /usr/bin/python3 /usr/bin/python


COPY ./docker/requirements.txt /tmp/requirements.txt

RUN apt update && apt install python-pip \
&&  pip install --upgrade pip \
&&  pip install --no-cache-dir -r /tmp/requirements.txt \
&&  pip freeze 

# xfvb
#RUN apt-get install -y xvfb

# Jenkins User ????

COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh


ENTRYPOINT [ "entrypoint.sh" ]
