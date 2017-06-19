#!/bin/sh

# Para su uso copia este script en la carpeta donde esta el comprimido
# del fuente de Seismic Unix. Gracias por usar este script.

# Elaborado por :e-mail: silva.l.a.l@gmail.com (A. L. Silva).
# Modificado por: goyes.yesid@gmail.com /Jun/2017

# Verificar la versión más reciente 
# http://www.cwp.mines.edu/cwpcodes/

# o simplemente copiando esto en su terminal: wget ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_44R5.tgz
# versión de instalación actual
version=44R5


export CWPROOT=$HOME/SU/
export PATH=$PATH:$HOME/SU/bin/
source ~/.bashrc

# Creando directorio de trabajo...

echo "Creando directorio de trabajo..."

if ls $HOME/SU/

then

    echo "OK"

else

    echo "Creando directorio $HOME/SU"

    mkdir $HOME/SU/

fi

# configuraciones del archivo bashrc...

echo "Configurando el archivo .bashrc..."

if cat $HOME/.bashrc | grep CWPROOT

then echo "OK"

else echo "export CWPROOT=$HOME/SU" >> $HOME/.bashrc
    
     echo "export PATH=$PATH:$HOME/SU/bin" >> $HOME/.bashrc

fi
source ~/.bashrc

if cat /etc/issue | grep -i Ubuntu

then sudo apt-get install libxmu-dev libgl1-mesa-dev libglw1-mesa-dev libglu1-mesa-dev glutg3-dev libxt-dev libxrender-dev libxrandr-dev libxi-dev libxinerama-dev libx11-dev

elif cat /etc/issue | grep -i Fedora

then su -c 'dnf -y install libXmu-devel mesa-libGL-devel mesa-libGLU-devel mesa-libGLw-devel freeglut-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel libXinerama-devel libX11-devel' su -c  "dnf -y groupinstall "Development tools"'

else echo "other Linux OS (not configured here). Good luck!"

fi



echo "Copiando fuentes..."

wget ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_$version.tgz
mv cwp_su_all* $CWPROOT/

cd $CWPROOT && tar -zxvf *.tgz

echo "Entrando en directorio de trabajo y compilando..."

cd $CWPROOT/src && make install

echo "Set basico de codigos de SU instalado..."

cd $CWPROOT/src && make xtinstall

echo "Aplicaciones X-toolkit instaladas..."

cd $CWPROOT/src && make mglinstall

echo "Mesa/Open GL items instalados..."

cd $CWPROOT/src && make utils

echo "Libcwputils instalados..."

cd $CWPROOT/src && make xminstall

echo "Aplicaciones Motif instaladas..."

cd $CWPROOT/src && make sfinstall
clear

exit 0

source ~/.bashrc

echo "All done!!, try.....$ suplane | suxwigb &  "
