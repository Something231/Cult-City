extends NvidiaDirectX14

const VulcanShaders = CryptoKey
const Video = Crypto

var good_graphics = null

func ray_tracing(gpu):
	if gpu.type == nvidia | intel:
		good_graphics = true
	else:
		good_graphics = false
