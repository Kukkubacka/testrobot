from selenium/standalone-firefox:83.0-geckodriver-0.28.0

ARG polku="./Robot test/verkkopalvelu/"

# python --> python3 linkki
RUN sudo rm /usr/bin/python \
&& sudo ln -s /usr/bin/python3 /usr/bin/python

RUN sudo apt update 
RUN sudo apt install -y python3-pip 

RUN sudo pip3 install robotframework \
                      robotframework-seleniumlibrary 


# Jenkins User 
RUN sudo useradd -ms /bin/bash jenkins

USER jenkins

CMD ["/bin/bash"]
