FROM nginx

WORKDIR /usr/share/nginx/html/

RUN apt update && \
  apt install git -y && \
  rm -rf /var/lib/apt/lists/*

# Clonamos un repo y lo movemos a una carpeta llamada 'temporal' (si no esta, la crea)
# Después copiamos esos datos a nuestro html y eliminamos la carpeta temporal
RUN git clone https://github.com/josejuansanchez/2048.git /temporal && \
  cp -r /temporal/* /usr/share/nginx/html/ && \
  rm -rf /temporal/*

EXPOSE 80

# arreglar la carpeta para que salga el juego dentro de html
# docker build -t nombreImagen .
# docker run -d --rm -p 80:80 nombreImagen
# test de docker.dev