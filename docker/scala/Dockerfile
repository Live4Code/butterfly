FROM java:8

ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

RUN git clone https://ymote:4160kite@github.com/Live4Code/butterfly.git /home/terminal/app

# Install Scala
RUN \
  cd /home/terminal && \
  curl -o scala-$SCALA_VERSION.tgz http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
  tar -xf scala-$SCALA_VERSION.tgz && \
  rm scala-$SCALA_VERSION.tgz && \
  echo >> /home/terminal/.bashrc && \
  echo 'export PATH=/home/terminal/scala-$SCALA_VERSION/bin:$PATH' >> /home/terminal/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

RUN apt-get update -y
RUN apt-get install -y python-setuptools python-dev build-essential libffi-dev libssl-dev

WORKDIR /home/terminal/app

RUN python setup.py build
RUN python setup.py install

RUN useradd -ms /bin/bash terminal
RUN chown -R terminal:terminal /home/terminal

# Set password
RUN echo "terminal:butterfly" | chpasswd

USER terminal
ENV HOME /home/terminal

ADD docker/run.sh /home/terminal/run.sh

EXPOSE 57575

CMD ["/home/terminal/run.sh"]
