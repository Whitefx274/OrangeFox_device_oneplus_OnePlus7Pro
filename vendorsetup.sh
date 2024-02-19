# Clone/Fetch Upstream Device Dependencies
# Device Tree
#echo "Cloning OnePlus 7Pro Tree"
# add clang-proton to our path
#export PATH="$(gettop)/prebuilts/clang/host/linux-x86/clang-proton/bin:$PATH"

echo "Cloning kernel tree"
git clone https://github.com/nebrassy/android_kernel_oneplus_sm8150 -b android-12.1 kernel/oneplus/sm8150 || echo "Already Done"
echo "Proceeding"
# add clang-proton to our path
#export PATH="$(gettop)/prebuilts/clang/host/linux-x86/clang-proton/bin:$PATH"

# Build environment stuffs
export ALLOW_MISSING_DEPENDENCIES=true
export TW_MAX_BRIGHTNESS=1000
