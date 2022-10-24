import multer from 'multer'


var storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'src/uploads')
    // cb(null, '/config')
  },

  // destination: '/tmp/my-uploads', .single('avatar')

  filename: (req, file, cb) => {
    cb(null, Date.now() + '-' + file.originalname)
  }
})

export const upload = multer({ dest: 'src/uploads' })