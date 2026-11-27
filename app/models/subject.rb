# Semester III subjects. Static data (no database table) — edit the list below to change content.
class Subject < Data.define(:code, :name, :blurb, :overview, :topics, :statutes, :cases)
  def self.all
    ALL
  end

  # Looks up a subject by its URL slug (e.g. "lbc-311"). Raises RecordNotFound so Rails returns a 404.
  def self.find(slug)
    all.find { |s| s.to_param == slug.to_s.downcase } ||
      raise(ActiveRecord::RecordNotFound, "Couldn't find subject #{slug.inspect}")
  end

  def to_param
    code.downcase
  end

  def elective?
    code.start_with?("LBE")
  end

  def previous
    index = self.class.all.index(self)
    self.class.all[index - 1] if index.positive?
  end

  def next
    self.class.all[self.class.all.index(self) + 1]
  end

  ALL = [
    new(
      code: "LBC-311",
      name: "Jurisprudence",
      blurb: "Schools of legal thought, sources of law, rights, duties, and personality.",
      overview: "Jurisprudence is the study of the nature of law itself — what law is, where it comes from, " \
                "and how legal concepts such as rights, ownership and personality are structured.",
      topics: [
        "Nature, scope and significance of jurisprudence",
        "Analytical positivism — Austin, Hart and Kelsen",
        "Natural law, historical and sociological schools; legal realism",
        "Sources of law — custom, precedent and legislation",
        "Legal rights and duties (Hohfeld's analysis)",
        "Ownership and possession",
        "Legal personality — natural and juristic persons"
      ],
      statutes: [],
      cases: [
        { name: "Kesavananda Bharati v. State of Kerala", year: 1973, point: "Basic structure doctrine — limits on the power to amend." },
        { name: "ADM Jabalpur v. Shivkant Shukla", year: 1976, point: "Positivism vs. natural rights during the Emergency." },
        { name: "Maneka Gandhi v. Union of India", year: 1978, point: "Procedure established by law must be fair, just and reasonable." }
      ]
    ),
    new(
      code: "LBC-312",
      name: "Company Law",
      blurb: "Incorporation, memorandum and articles, share capital, directors, and winding up.",
      overview: "Company law governs how companies are formed, financed, managed and dissolved, " \
                "and balances the interests of shareholders, directors, creditors and the public.",
      topics: [
        "Nature of a company; corporate veil and its lifting",
        "Incorporation, promoters and pre-incorporation contracts",
        "Memorandum and articles of association; doctrine of ultra vires",
        "Constructive notice and indoor management",
        "Prospectus, shares, debentures and share capital",
        "Directors — appointment, powers and duties",
        "Meetings, majority rule and minority protection",
        "Oppression and mismanagement; winding up"
      ],
      statutes: ["Companies Act, 2013", "Insolvency and Bankruptcy Code, 2016"],
      cases: [
        { name: "Salomon v. A. Salomon & Co. Ltd.", year: 1897, point: "A company is a legal person distinct from its members." },
        { name: "Ashbury Railway Carriage & Iron Co. v. Riche", year: 1875, point: "Acts beyond the memorandum are ultra vires and void." },
        { name: "Royal British Bank v. Turquand", year: 1856, point: "Doctrine of indoor management." },
        { name: "Foss v. Harbottle", year: 1843, point: "Rule of majority; the company is the proper plaintiff." }
      ]
    ),
    new(
      code: "LBC-313",
      name: "Code of Civil Procedure & Limitation Act",
      blurb: "Jurisdiction, pleadings, decrees, execution, appeals, and limitation periods.",
      overview: "The CPC lays down the procedure civil courts follow from the filing of a suit to the execution " \
                "of a decree. The Limitation Act fixes the time within which suits, appeals and applications must be brought.",
      topics: [
        "Jurisdiction of civil courts (s. 9); res sub judice and res judicata (ss. 10–11)",
        "Place of suing and institution of suits",
        "Pleadings, plaint and written statement (Orders VI–VIII)",
        "Summons, appearance and ex parte decrees",
        "Judgment and decree; execution (s. 36 onwards, Order XXI)",
        "Appeals, reference, review and revision (ss. 96–115)",
        "Temporary injunctions (Order XXXIX)",
        "Limitation — bar of limitation, condonation of delay, acknowledgement, adverse possession"
      ],
      statutes: ["Code of Civil Procedure, 1908", "Limitation Act, 1963"],
      cases: [
        { name: "Satyadhyan Ghosal v. Deorajin Debi", year: 1960, point: "Res judicata applies between stages of the same proceeding." },
        { name: "Salem Advocate Bar Association v. Union of India", year: 2005, point: "Validity of the 1999/2002 CPC amendments; case management." },
        { name: "Collector, Land Acquisition, Anantnag v. Mst. Katiji", year: 1987, point: "Liberal approach to 'sufficient cause' for condoning delay." }
      ]
    ),
    new(
      code: "LBC-314",
      name: "Environmental Law",
      blurb: "Constitutional mandates, pollution statutes, and the National Green Tribunal.",
      overview: "Environmental law covers the constitutional, statutory and judge-made rules that protect air, water, " \
                "forests and wildlife, and the principles courts use to hold polluters accountable.",
      topics: [
        "Constitutional framework — Arts. 21, 48A and 51A(g)",
        "Principles — sustainable development, precautionary and polluter pays",
        "Water and air pollution control",
        "Environment (Protection) Act and environmental impact assessment",
        "Forest and wildlife conservation",
        "Absolute liability and public interest litigation",
        "National Green Tribunal — jurisdiction and powers"
      ],
      statutes: [
        "Environment (Protection) Act, 1986",
        "Water (Prevention and Control of Pollution) Act, 1974",
        "Air (Prevention and Control of Pollution) Act, 1981",
        "Wild Life (Protection) Act, 1972",
        "Forest (Conservation) Act, 1980",
        "National Green Tribunal Act, 2010"
      ],
      cases: [
        { name: "M.C. Mehta v. Union of India (Oleum Gas Leak)", year: 1987, point: "Absolute liability for hazardous industries." },
        { name: "Vellore Citizens' Welfare Forum v. Union of India", year: 1996, point: "Precautionary and polluter pays principles are part of Indian law." },
        { name: "Indian Council for Enviro-Legal Action v. Union of India", year: 1996, point: "Polluter pays applied to remediation costs." },
        { name: "Subhash Kumar v. State of Bihar", year: 1991, point: "Right to pollution-free water and air under Art. 21." }
      ]
    ),
    new(
      code: "LBC-215",
      name: "Labour & Industrial Law I",
      blurb: "Industrial disputes, trade unions, standing orders, and wage legislation.",
      overview: "Labour and industrial law regulates the relationship between employers, workers and trade unions, " \
                "and provides machinery for preventing and settling industrial disputes.",
      topics: [
        "Concepts of industry, workman and industrial dispute",
        "Authorities under the Industrial Disputes Act — conciliation, adjudication, arbitration",
        "Strikes and lock-outs",
        "Lay-off, retrenchment and closure",
        "Registration, rights and liabilities of trade unions",
        "Standing orders — certification and modification",
        "Labour codes — overview of the Industrial Relations Code, 2020"
      ],
      statutes: [
        "Industrial Disputes Act, 1947",
        "Trade Unions Act, 1926",
        "Industrial Employment (Standing Orders) Act, 1946",
        "Industrial Relations Code, 2020"
      ],
      cases: [
        { name: "Bangalore Water Supply & Sewerage Board v. A. Rajappa", year: 1978, point: "The 'triple test' defining 'industry'." },
        { name: "Workmen of Dimakuchi Tea Estate v. Management", year: 1958, point: "Who may raise an industrial dispute." },
        { name: "Excel Wear v. Union of India", year: 1978, point: "Right to close a business and limits on regulation." }
      ]
    ),
    new(
      code: "LBE-316A",
      name: "Information Technology Law",
      blurb: "The IT Act, e-contracts, digital signatures, cybercrime, and data protection.",
      overview: "IT law deals with legal recognition of electronic transactions, cybercrime, intermediary liability " \
                "and the protection of personal data in a digital world.",
      topics: [
        "Legal recognition of electronic records and e-governance",
        "Digital and electronic signatures; certifying authorities",
        "Electronic contracts",
        "Cybercrimes and penalties under the IT Act",
        "Intermediary liability and safe harbour",
        "Electronic evidence",
        "Privacy and data protection"
      ],
      statutes: [
        "Information Technology Act, 2000",
        "Digital Personal Data Protection Act, 2023",
        "IT (Intermediary Guidelines and Digital Media Ethics Code) Rules, 2021"
      ],
      cases: [
        { name: "Shreya Singhal v. Union of India", year: 2015, point: "Section 66A struck down as unconstitutional." },
        { name: "Justice K.S. Puttaswamy v. Union of India", year: 2017, point: "Privacy is a fundamental right." },
        { name: "Anvar P.V. v. P.K. Basheer", year: 2014, point: "Certificate requirement for electronic evidence." },
        { name: "Avnish Bajaj v. State (NCT of Delhi)", year: 2008, point: "Liability of intermediaries and their directors." }
      ]
    )
  ].freeze
end
