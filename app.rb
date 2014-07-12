require_relative 'segment'
require 'httparty'

get '/' do
  erb :index
end

post '/search' do
    case params[:list]
    when 'cities'
      @segments = Segment.create_from_cities(params[:query])
    when 'parks'
      @segments = Segment.create_from_national_parks(params[:query])
    end
    erb :search, collection: @segments
end


CITIES = "Atlanta+GA
      |Orlando+FL
      |Charleston+SC
      |Denver+CO
      |Washington+DC
      |New+Orleans+LA
      |New+York+NY
      |Asheville+NC
      |Chicago+IL
      |Indianapolis+IN
      |Jackson+WY
      |Miami+FL
      |Los+Angeles+CA
      |Phoenix+AZ
      |Austin+TX
      |San+Francisco+CA
      |Portland+OR
      |Las+Vegas+NV
      |Nashville+TN
      |Montreal+QC
      |Toronto+ON
      |Birmingham+AL
      |St+Louis+MO
      |Kansas+City+MO
      |Seattle+WA
      |Vancouver+BC"

NATIONAL_PARKS = "Acadia+National+Park
|Arches+National+Park
|Badlands+National+Park
|Big+Bend+National+Park
|Biscayne+National+Park
|Black+Canyon+of+the+Gunnison
|Bryce+Canyon+National+Park
|Canyonlands+National+Park
|Capitol+Reef+National+Park
|Carlsbad+Caverns+National+Park
|Channel+Islands+National+Park
|Congaree+National+Park
|Crater+Lake+National+Park
|Cuyahoga+Valley+National+Park
|Death+Valley+National+Park
|Everglades+National+Park
|Glacier+National+Park
|Grand+Canyon+National+Park
|Grand+Teton+National+Park
|Great+Basin+National+Park
|Great+Sand+Dunes+National+Park
|Great+Smoky+Mountains+National+Park
|Guadalupe+Mountains+National+Park
|Hot+Springs+National+Park
|Joshua+Tree+National+Park
|Kings+Canyon+National+Park
|Lassen+Volcanic+Park
|Mammoth+Cave+Park
|Mesa+Verde+National+Park
|Mount+Rainier+National+Park
|North+Cascades+National+Park
|Olympic+National+Park
|Petrified+Forest+National+Park
|Redwood+National+Park
|Rocky+Mountain+National+Park
|Saguaro+National+Park
|Sequoia+National+Park
|Shenandoah+National+Park
|Theodore+Roosevelt+National+Park
|Voyageurs+National+Park
|Wind+Cave+National+Park
|Yellowstone+National+Park
|Yosemite+National+Park
|Zion+National+Park"
