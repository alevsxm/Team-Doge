require 'rails_helper'

response_hash = {
    "educations" => {
        "_total" => 1,
        "values" => [
            {
                      "degree" => "Bachelor of Arts (BA)",
                     "endDate" => {
                    "year" => 2005
                },
                "fieldOfStudy" => "Economics",
                          "id" => 594644,
                  "schoolName" => "Colgate University",
                   "startDate" => {
                    "year" => 2001
                }
            }
        ]
    },
     "firstName" => "Alex",
      "headline" => "WDI Student at General Assemb.ly",
            "id" => "jr8obGuqo-",
      "industry" => "Internet",
      "lastName" => "Levine",
      "location" => {
        "country" => {
            "code" => "us"
        },
           "name" => "Greater New York City Area"
    },
    "pictureUrl" => "http://m.c.lnkd.licdn.com/mpr/mprx/0_1C0R3cD1Wgq19WcUPTOk3vj0dY8yq7cUA5Ik3Nah94NuIIhRxkfc7qsaFPh_Be9B-TjLa1rDDqpa",
     "positions" => {
        "_total" => 5,
        "values" => [
           {
                  "company" => {
                      "id" => 2408664,
                    "name" => "General Assemb.ly"
                },
                       "id" => 550318447,
                "isCurrent" => true,
                "startDate" => {
                    "month" => 6,
                     "year" => 2014
                },
                  "summary" => "Currently enrolled in General Assemb.ly's 3 month web immersive program",
                    "title" => "WDI Student"
            },
             {
                  "company" => {
                      "id" => 606696,
                    "name" => "Shore Group Associates"
                },
                  "endDate" => {
                    "month" => 12,
                     "year" => 2013
                },
                       "id" => 316143355,
                "isCurrent" => false,
                "startDate" => {
                    "month" => 7,
                     "year" => 2012
                },
                  "summary" => "Product Manager of several innovative web and mobile applications.  Responsible for the entire product life cycle from idea validation, customer discovery, through story boarding, wire framing, design and development, to product launch, tracking analytics and social media marketing.",
                    "title" => "Product Manager"
            },
            {
                  "company" => {
                      "id" => 60129,
                    "name" => "Permal Group"
                },
                  "endDate" => {
                    "month" => 6,
                     "year" => 2012
                },
                       "id" => 119602064,
                "isCurrent" => false,
                "startDate" => {
                    "month" => 8,
                     "year" => 2009
                },
                  "summary" => "Managed U.S. Client Services team, responsible for tracking and reporting fund activity flows, oversight and management of global transfer agent, and providing operational support of sales teams and distribution partners.",
                    "title" => "Operations Manager"
            },
            {
                  "company" => {
                      "id" => 60129,
                    "name" => "Permal Group"
                },
                  "endDate" => {
                    "month" => 8,
                     "year" => 2009
                },
                       "id" => 511329539,
                "isCurrent" => false,
                "startDate" => {
                    "month" => 10,
                     "year" => 2006
                },
                  "summary" => "Served as primary operational liaison for current and prospective clients.  Led various initiatives to improve group efficiency in reconciliation and reporting through use of Excel, VBA, and Access tools.  Assumed leadership of designing several fund restructurings as a result of the financial environment in 2008 and 2009, and worked closely with clients and across departments to ensure smooth communication and implementation of changes.",
                    "title" => "Operations Analyst"
            },
            {
                  "company" => {
                      "id" => 60129,
                    "name" => "Permal Group"
                },
                  "endDate" => {
                    "month" => 10,
                     "year" => 2006
                },
                       "id" => 511330526,
                "isCurrent" => false,
                "startDate" => {
                    "month" => 4,
                     "year" => 2006
                },
                  "summary" => "Responsible for processing trades and reconciling activity to transfer agent.  Provided high level fund activity reporting to Investment Team and Executive Committee.  Liaised regularly with offshore transfer agent and administrators.",
                    "title" => "Junior Operations Analyst"
            }
        ]
    },
       "summary" => "Began career in finance and made the leap into tech in 2012.  Currently I’m a Product Manager with startup experience, and I’m well versed in all aspects of the product lifecycle.  I’m intellectually curious, a great communicator, and have a strong entrepreneurial streak; now working on a mobile app with a mission to disrupt the fantasy sports industry."
}

describe User do
  let(:alex) { User.create_user(response_hash) }
  it 'has a linkedin_member_id' do
    expect(alex.linkedin_member_id).to eq('jr8obGuqo-')
  end
end
