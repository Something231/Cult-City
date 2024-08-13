extends NvidiaDirectX14

const VulcanShaders = CryptoKey
const Video = Crypto
const Lighting = RayCast2D

var raytracing = null

func ray_tracing(gpu):
	if gpu.type == nvidia | intel:
		raytracing = true
	else:
		raytracing = false
