# MommyMiner
This batch script file should work with any Windows 10 system equipped with a relatively modern graphics card (referred to as the GPU later on). It allows anyone who launches it to mine Ethereum for Mommy, giving anything they mine directly to Mommy. Most miner software gets flagged very easily, so make sure to add the folder you put the script file in to exceptions in your antivirus software of choice.

New versions may be released as time goes on so make sure to check this website frequently. Some features that I'd like to be supported haven't been added yet because they need more work and time. Not because I'm lazy or anything.

You can get the download in the release tab or [right here](https://github.com/DoppiePoppie/MommyMiner/releases). Make sure to always download the newest available version.

# Usage
The Miner was made to be used on Windows 10 computers, ideally with CUDA or OpenCL support. Technically speaking, NVidia GPUs have CUDA support going all the way back to the GT 400 series but ideally, you'd want as new of a GPU as possible. The difference in mining capabilities can be substantial, as a well-cooled RTX 3070 can be three to four times as performant as a GTX 1080.

Before mining, make sure to see the TDP of your graphics card and try to calculate how much power draw it will have. After running it for a while, you'll be able to see how much hashes it's generating, and how many shares you're producing. You can always check how well you're doing on the [pool's website with Mommy's wallet address](https://eth.2miners.com/account/0xb5c174e8061d8b4d355b5b1f64dd63f0f18c9deb).

# Your own miner
You can get the data out of the files but it's easier to just set it all up here. If you'd rather use a different mining software, that's okay. Just set it all up and use the data given here.

Pool: `eth.2miners.com:2020`

Wallet Address: `0xb5c174e8061d8b4d355b5b1f64dd63f0f18c9deb`

Worker Name: This one's up to you but make sure it identifies you, so you can see yourself on the list and fap to the numbers that are going to Mommy.

# Currently supported features
- [x] Automatic miner download.
- [x] Choosing your workername.
- [x] Automatically mining on launch.
- [ ] The ability to choose which mining software you use.
- [ ] Multiple cryptocurrency support.
- [ ] Automatic adding to startup.
- [ ] Automatic self-update.

And possibly more to come...
