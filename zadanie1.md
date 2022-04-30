<h1>Zadanie 1 z Technologii Chmurowych - Eliza Kozioł<h1><br>

<h2>Część podstawowa:<h2>

Zad 1. 

Aplikacja napisana w szkielecie Express.js znajduje się w katalogu "zadanie1". Wykorzystywany port to 5000.<br>

Zad 2.

Plik Dockerfile wraz z komentarzami umieszczony powyżej w obecnym repozytorium. <br>

Zad 3.

a. zbudowanie obrazu kontenera<br>
	<li>docker build -t one:5 . </li><br>
b. uruchomienie kontenera na podstawie zbudowaego obrazu<br>
	<li>docker --run --name contone5 -p 5000:5000 one:5</li><br>
c. sprawdzenie logów<br>
	<li>docker logs contone5</li><br>
d. sprawdzenie warstw obrazu<br>
	<li>docker history one:5</li><br>

<img src="img/okno_przeglądarki.png" />
<img src="img/logi.png" />
<img src="img/warstwy.png" />

Zad 4.

Użyte instrukcje:<br>
	sudo apt-get install -y qemu-user-static<br>
	docker buildx create --name taskbuilder<br>
	docker buildx use taskbuilder<br>
	docker buildx inspect --bootstrap<br>
	docker buildx build -t ek00/zadanie1 --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --push .<br><br>
	
[DockerHub](https://hub.docker.com/repository/docker/ek00/zadanie1)

<h2>Dodatek 1:<h2>	

WORKFLOW: <br>

Wybrany typ maszyny: ubuntu-latest<br>
"checkout" - jest to sprawdzenie, czy repozytorium jest dostępne dla workflow<br>
"docker/setup-qemu-action@v1" - instalacja qemu do wielu architektur<br>
"docker/setup-buildx-action@v1" - stworzenie i skonfigurowanie buildx'a potrzebnego do wielu architektur<br>
"actions/cache@v2" - umożliwia cache'owanie zależności, eksport cache'a<br>
"docker/login-action@v1" - logowanie do GitHub registry<br>
"docker/build-push-action@v2" - umożliwia zbudowanie i wypchnięcie obrazu za pomocą buildx'a<br>
"Move cache" - ustawienie eksportu cache'a i nadpisywanie starego nowym<br>

<img src="img/cache.png" />
