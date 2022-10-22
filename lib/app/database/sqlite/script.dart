final createTable = '''
CREATE TABLE contact(
  id INTEGER NOT NULL PRIMARY KEY
  ,nome VARCHAR(200) NOT NULL
  ,telefone VARCHAR(16) NOT NULL
  ,email VARCHAR(150) NOT NULL
  ,url_avatar VARCHAR(300) NOT NULL
)
''';

final insert1 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Pietro', '(99) 9 9999-9999', 'pietro@mail.com', 'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''';

final insert2 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Visão', '(88) 9 8888-8888', 'visao@mail.com', 'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png')
''';

final insert3 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Hortência', '(77) 9 7777-7777', 'hortencia@mail.com', 'https://cdn.pixabay.com/photo/2017/04/30/11/42/hijab-2272708_960_720.png')
''';
