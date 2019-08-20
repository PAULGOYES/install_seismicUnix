#!/bin/sh

# Este script descarga automáticamente la carpeta comprimida del instalador 
# por lo tanto, se requiere una conexión a Internet . En caso de instalador sin Internet se debe descargar manualmente
# el instalador (*.tgz) y copiarlo en la misma carpeta del script. Se debe comentar (#) la linea 72 de este script

# Elaborado por :e-mail: silva.l.a.l@gmail.com (A. L. Silva). 2012
# Modificado por: goyes.yesid@gmail.com 10/Jul/2019


# PASO 1: DESCARGAR EL SEISMIC UNIX
# Ir a la carpeta HOME
# cd $HOME
# Descargar seismic unix:  wget https://github.com/JohnWStockwellJr/SeisUnix/archive/master.zip
# unzip master.zip
# mv SeisUnix-master SeisUnix
# versión de instalación actual



CWPROOT=$HOME/SeisUnix

export CWPROOT=$HOME/SeisUnix/
export PATH=$PATH:$HOME/SeisUnix/bin/
# Creando directorio de trabajo...
echo "Creando directorio de trabajo..."
if ls $HOME/SeisUnix/
then
    echo "OK"
else
    echo "Creando directorio $HOME/SeisUnix"
    mkdir $HOME/SeisUnix/
fi
# configuraciones del archivo bashrc...
echo "Configurando el archivo .bashrc..."
if cat $HOME/.bashrc | grep CWPROOT
then echo "OK"
else echo "export CWPROOT=$HOME/SeisUnix" >> $HOME/.bashrc
     echo "export PATH=$PATH:$HOME/SeisUnix/bin" >> $HOME/.bashrc
fi

if cat /etc/os-release  | grep -i Ubuntu 
then sudo apt-get install libxmu-dev libgl1-mesa-dev libglw1-mesa-dev libglu1-mesa-dev libxt-dev libxrender-dev libxrandr-dev libxi-dev libxinerama-dev libx11-dev libxm4 libuil4 libmrm4 libmotif-common

elif cat /etc/os-release  | grep -i Fedora
then sudo dnf -y install libXmu-devel mesa-libGL-devel mesa-libGLU-devel mesa-libGLw-devel freeglut-devel libXt-devel libXrender-devel libXrandr-devel libXi-devel libXinerama-devel libX11-devel

else echo "other Linux OS (not configured here). Good luck!"
fi

# wget https://github.com/JohnWStockwellJr/SeisUnix/archive/master.zip
#cd $CWPROOT && tar -xvzf *.tar.gz

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
clear
pause

cd $CWPROOT/src && make remake
cd $CWPROOT/src/tri && make 
cd $CWPROOT/src/Trielas && make
cd $CWPROOT/src/xplot && make
cd $CWPROOT/src/xtri && make
cd $CWPROOT/src/su && make
cd $CWPROOT/src/par && make
cd $CWPROOT/src/Fortran && make remake
clear
echo "Finalizado!!, escriba en la terminal: source ~/.bashrc "
echo "Comprobar instalación escribiendo: "
echo "suplane | suxwigb title='my first graph' & "

echo "Finalizado!!, escriba en la terminal: source ~/.bashrc "
echo "Comprobar instalación escribiendo: "
echo "suplane | suxwigb title='my first graph' & "
