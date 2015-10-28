# libopenssl

## Build Steps

* Get the code


```
git clone https://github.com/kingbeful/libopenssl.git
cd libopenssl/
```


* Download the openssl source code (e.g. __openssl-1.0.1p.tar.gz__)

```
curl -O https://www.openssl.org/source/openssl-1.0.1p.tar.gz
```


* Compile for iOS


Go to the ios directory. 
Modify below line in __run.sh__


```
# change the SDK version
if [ -z $1 ]; then
	SDK_VERSION="9.1"
else
	SDK_VERSION=$1
fi

# change the openssl version
OPENSSL_VERSION="openssl-1.0.1p"

```

Then

```
./run.sh
```


* Compile for android

Go to the android directory. 
Modify below line in __run.sh__

```
OPENSSL_VERSION="openssl-1.0.1p"
```

Set the correct values according your environment in __Setenv-android.sh__

```
_ANDROID_NDK="android-ndk-r8e"
_ANDROID_EABI="arm-linux-androideabi-4.6"
_ANDROID_ARCH=arch-arm
_ANDROID_API="android-14"

```

Then

```
./run.sh
```


