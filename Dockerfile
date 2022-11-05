FROM nginx:latest 
RUN apt install python
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
RUN apt install -y curl
COPY index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;","flask","run"]
