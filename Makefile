all: clean out/debian-persistence-live.x86_64-12.1.iso

clean:
	rm -rf out
	rm base_packages.txt || true
	rm packages.xml || true
	mv ./backup.appliance.kiwi.backup ./appliance.kiwi || true

out/debian-persistence-live.x86_64-12.1.iso: clean base_packages.txt packages.xml appliance.kiwi
	# for some reason <include/> isn't processed correctly with kiwi
	cp ./appliance.kiwi ./backup.appliance.kiwi.backup
	sed "s/<include from=\"file:\/\/.\/packages.xml\"\/>/$(shell cat ./packages.xml | sed 's/"/\\"/g' | sed 's/\//\\\//g')/" -i ./appliance.kiwi
	kiwi-ng system build --description . --target-dir out
	mv ./backup.appliance.kiwi.backup ./appliance.kiwi

base_packages.txt:
	./gen_base_packages.sh

packages.xml:
	./gen_packages_xml.sh
