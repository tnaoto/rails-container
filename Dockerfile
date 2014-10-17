FROM centos:centos6

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y
RUN yum -y install sqlite3 gcc gcc-c++ make openssl-devel zlib-devel readline-devel glibc-devel libxslt-devel patch git curl tar gzip

RUN mkdir /work
WORKDIR /work
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz && tar -zxvf ruby-2.1.2.tar.gz && cd /work/ruby-2.1.2 && ./configure --disable-install-doc && make && make install && rm -rf /work/ruby-2.1.2.tar.gz
RUN echo 'gem: --no-document' > /usr/local/etc/gemrc

RUN \
  echo 'gem: --no-rdoc --no-ri' >> /.gemrc && \
    gem install bundler
