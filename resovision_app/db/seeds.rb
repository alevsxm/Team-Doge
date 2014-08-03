
User.destroy_all
Resovision.destroy_all
Position.destroy_all
Education.destroy_all
Video.destroy_all

# Users
liza = User.create(
  linkedin_pw: "",
  linkedin_email: "liza.h.ramo@gmail.com"
)

# Resovision:
liza.resovision.push(
  Resovision.create(
  linkedin_id: "b7m0rmBKE7",
  last_name: "Ramo",
  first_name: "Liza",
  headline: "Content Developer at IBM",
  location: "Greater New York City Area",
  industry: "Public Relations and Communications",
  num_positions: 5,
  num_educations: 1,
  pic_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_2bYEOgZpbv-QM7PhC_SJO0w-51vbv2-haiEzO0VisvTBEeL88TmQKxmDwOzZ9I12DkyNAZH527sk",
  user_id: 1
))
