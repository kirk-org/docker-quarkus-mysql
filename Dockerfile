FROM oracle/graalvm-ce:latest

RUN mkdir /opt/docker-quarkus-mysql

WORKDIR /opt/docker-quarkus-mysql

COPY . /opt/docker-quarkus-mysql

RUN ./mvnw dependency:go-offline -B

ENV PORT 8080
EXPOSE 8080

#RUN gu install ruby
#RUN echo 'puts "Hello from Truffleruby!\nVersion: #{RUBY_DESCRIPTION}"' > app.rb
#CMD ruby app.rb

CMD ["/bin/bash", "-c","./mvnw compile quarkus:dev"]