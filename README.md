
# eng-zap-challenge-swift

## Autor
<b> Kaique Magno </b>
<i> kaique.magno@hotmail.com </i>

## Apresentação
### A Idéia
Ao iniciar o projeto queria fazer ele o mais completo possível, como para um App que fosse para loja, pensando nisso deixei o app Localizable e utilizei do SwiftGen, para ajudar gerando o enum L10n que ja traz a string com o localizable correto, além disso separei o Target de Test para poder aplicar os frameworks Quick Nimble e NimbleSnapshot somente nele assim separando esses frameworks do projeto original. Na intenção de fazer uma experiencia complete tentei também integra com a CI do Github mas tive alguns problemas e acabei não seguindo com a idéia

### Arquitetura  e Padrões
O App segue uma arquitetura VIPER a qual escolhi por me sentir não só mais confortável mas também por conseguir separar bem as responsabilidades das telas e para ajudar com isso criei algumas classes para centralizar repsonsabilidades compartilhadas, uma delas é o Formatter que serve para cuidar do texto que venha para que esse apareça no formato correto. Além da arquitetura tentei usar alguns Design Patterns no projeto como Factory e Filter.

### View Coding
Por já estar acostumado com view coding seguir usando nesse projeto também e utilizei de ajuda o SnapKit, porém fiz a tela Home ou Lista de propriedades usando o Storyboard para demonstração de conhecimento.

### O Que faltou ?
- Tive a intenção de usar uma base de cor também para poder trabalhar com o Dark/Light mode.
- A tela de Loading
- Mais testes
- Integração com CI
- Aplicar Analytics

## Copyright e referências
> Icones feito pelo <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> do <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>> 
> 
> Models gerados pelo <a href="https://app.quicktype.io" title="QuickType">QuickType</a>
> 
> Gerenciador de dependencia <a href= "https://github.com/Carthage/Carthage"> Carthage </a>
> 
> Frameworks usados:
> 
> - <a href="https://github.com/SwiftGen/SwiftGen">SwiftGen</a>
> 
> - <a href="https://github.com/onevcat/Kingfisher">Kingfisher</a>
> 
> - <a href="http://snapkit.io">SnapKit</a>
> 
> - <a href="https://github.com/Quick/Quick">Quick</a>
> 
> - <a href="https://github.com/Quick/Nimble">Nimble</a>
> 
> - <a href="https://github.com/ashfurrow/Nimble-Snapshots">Nimble-Snapshots</a>
> 
> Written with [StackEdit](https://stackedit.io/).
