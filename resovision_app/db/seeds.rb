
User.destroy_all
Resovision.destroy_all
Position.destroy_all
Education.destroy_all
Video.destroy_all

# Users
liza = User.create(
  linkedin_member_id: "b7m0rmBKE7"
)

# Resovision:
liza.resovision =
  resovision_one = Resovision.create(
  first_name: "Liza",
  last_name: "Ramo",
  headline: "Content Developer at IBM",
  location: "Greater New York City Area",
  industry: "Public Relations and Communications",
  num_positions: 3,
  num_educations: 1,
  summary: "Awesome web dev.",
  pic_url: "http://m.c.lnkd.licdn.com/mpr/mprx/0_2bYEOgZpbv-QM7PhC_SJO0w-51vbv2-haiEzO0VisvTBEeL88TmQKxmDwOzZ9I12DkyNAZH527sk"
)

# Positions:
resovision_one.positions.push(
  position_zero = Position.create(
    title: "Client References Content Developer",
    summary: "Develop & deliver compelling IBM success stories spanning multiple industries for international clients including Bank of America, IKEA, Toyota & Kenneth Cole | Adhere to strict corporate design & legal guidelines | Produce educational presentations for a variety of IBM hardware, software & services such as virtualization, consolidation & cloud computing | Conduct intensive technical & market research | Provide subject matter expertise for relevant IBM products & services",
    is_current: true,
    start_year: 2012,
    start_month: 8,
    end_year: nil,
    end_month: nil,
    company_name: "IBM"
  ),
  position_one = Position.create(
    title: "Social Media Content Developer & IBM SmartCloud Content Manager",
    summary: "Developed content, led small contests & created engagement activities for official IBM social media accounts | Increased official IBM Redbooks Facebook & Twitter accounts by 5,000 fans & 4,000 followers | Managed HootSuite account, tracked analytics & collaborated with other IBM social media teams",
    is_current: false,
    start_year: 2012,
    start_month: 4,
    end_year: 2012,
    end_month: 8,
    company_name: "IBM"
  ),
  position_two = Position.create(
    title: "Media Content Developer",
    summary: "Wrote and edited marketing collateral for Web and print, including IBM.com sites, HTML emails, newsletters, white papers & solution briefs for IBM brands such as IBM Watson.",
    is_current: false,
    start_year: 2011,
    start_month: 3,
    end_year: 2012,
    end_month: 4,
    company_name: "IBM"
  )
)

# Education:
resovision_one.educations.push(
  education_one = Education.create(
    school_name: "University of North Carolina at Chapel Hill",
    degree: "BA",
    field_of_study: "Communication Studies",
    start_year: 2006,
    end_year: 2010
  ),
  education_one = Education.create(
    school_name: "Hendersonville High School",
    degree: nil,
    field_of_study: nil,
    start_year: 2002,
    end_year: 2006
  )
)





###
