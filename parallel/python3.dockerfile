from selenium/standalone-chrome:87.0

ARG polku="./parallel/"

# python --> python3 linkki
RUN sudo rm /usr/bin/python \
&& sudo ln -s /usr/bin/python3 /usr/bin/python

#COPY ${polku}docker/requirements.txt /tmp/requirements.txt

RUN sudo apt update 
RUN sudo apt install -y python3-pip 
#RUN sudo pip install -y --upgrade pip 

RUN sudo pip3 install robotframework \
                      robotframework-seleniumlibrary 

# xfvb
RUN sudo apt-get install -y xvfb

# Jenkins User ????

#COPY ${polku}docker/entrypoint.sh /usr/local/bin/entrypoint.sh
#RUN chmod a+x /usr/local/bin/entrypoint.sh

#ENTRYPOINT [ "entrypoint.sh" ]
CMD ["/bin/bash"]
