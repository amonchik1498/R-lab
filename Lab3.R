library(rvest)
my_data <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")

rankData_html <- html_nodes(my_data,'.text-primary')
rankData <- html_text(rankData_html)
rankData<-as.numeric(rankData)

titleData_html <- html_nodes(my_data,'.lister-item-header a')
titleData <- html_text(titleData_html)

runtimeData_html <- html_nodes(my_data,'.text-muted .runtime')
runtimeData <- html_text(runtimeData_html)
runtimeData<-gsub(" min","",runtimeData)
runtimeData<-as.numeric(runtimeData)

my_movies <- data.frame(Rank = rankData, Title = titleData, Runtime = runtimeData, stringsAsFactors = FALSE )

#Виведіть перші 6 назв фільмів дата фрейму.
head(my_movies$Title, 6)
#[1] "Людина-павук: Повернення додому" "Вітряна ріка"                    "Той, хто біжить по лезу 2049"    "Вбивство священного оленя"      
#[5] "Назви мене своїм ім'ям"          "Тор: Раґнарок"     

#Виведіть всі назви фільмів с тривалістю більше 120 хв.
my_movies[my_movies$Runtime > 120, ]$Title
#[1] "Людина-павук: Повернення додому"          "Той, хто біжить по лезу 2049"             "Вбивство священного оленя"               
#[4] "Назви мене своїм ім'ям"                   "Тор: Раґнарок"                            "Чужий: Заповіт"                          
#[7] "Воно"                                     "Вартові Галактики 2"                      "Kingsman: Золоте кільце"                 
#[10] "Мати!"                                    "Форма води"                               "Диво-жінка"                              
#[13] "Логан: Росомаха"                          "Король Артур: Легенда меча"               "Красуня і Чудовисько"                    
#[16] "Джон Вік 2"                               "Пірати Карибського моря: Помста Салазара" "Зоряні війни: Епізод 8 - Останні Джедаї" 
#[19] "Трансформери: Останній лицар"             "Валеріан і місто тисячі планет"           "Метелик"                                 
#[22] "Гра Моллі"                                "Примарна нитка"                           "Вороги"                                  
#[25] "Темні часи"                               "Постріл в безодню"                        "Хатина"                                  
#[28] "Сім сестер"                               "Усі гроші світу"                          "Невідомий солдат"                        
#[31] "Війна за планету мавп"                    "Форсаж 8"                                 "Saban's Могутні рейнджери"               
#[34] "1+1: Нова історія"                       

#Скільки фільмів мають тривалість менше 100 хв.
length(my_movies[my_movies$Runtime < 100, ]$Title)
#[1] 18
