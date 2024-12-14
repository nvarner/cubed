open import Cubed.Level

open import Cubed.Data.Eq.Base using (_≡_; refl; to-path)

open import Cubed.Id.Base using (Id-sys)

open import Cubed.Path.Base as Path using ()


module Cubed.Data.Eq.Properties where

private variable
  ℓ : Level

instance id-sys : Id-sys (Type ℓ)
id-sys .Id-sys._≡ₛ_ = _≡_
id-sys .Id-sys.reflₛ = refl
id-sys .Id-sys.≡ₛ→≡ = to-path
id-sys .Id-sys.path-to-reflₛ refl = Path.refl

