FROM alpine AS build1
# w I etapie wybrano obraz alpine ze względu na małą pojemność i nadano mu nazwę build 1
RUN mkdir /task
#utworzenie katalogu
RUN apk add --no-cache npm
#polecenie instalujące npm w alpine 
WORKDIR /task
#ustawienie utworzonego folderu jako working directory
ADD zadanie1/index.js zadanie1/package.json zadanie1/package-lock.json ./
#dodatnie utworzonych w zad.1 plików
RUN npm install
#wykonanie polecenia npm install

FROM alpine
# w II etapie również wybrano alpine
COPY --from=build1 /task  /task
#Kopia folderu task z build1
RUN apk add --no-cache nodejs
#polecenie dodające nodejs do alpine
WORKDIR /task
#ustawienie working directory na utworzony folder task
EXPOSE 5000
#wystawienie portu na 5000
ENTRYPOINT ["node", "index.js"]
#ustawienie entrypointu na node index.js (plik js utworzony w ramach zadania 1)
LABEL student = "Eliza Kozioł"
#dodanie do dockerfile informacji w postaci imienia i naziwska  