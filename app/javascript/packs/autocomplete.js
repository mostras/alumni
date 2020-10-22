import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  let companies = false;
  let searchInput = false;

  const dataDiv = document.getElementById('autocomplete-company')
  if (dataDiv) {
    companies = JSON.parse(dataDiv.dataset.companies)
    searchInput = document.querySelector('.autocomplete-input');
  }
  if (companies && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = companies;
          console.log(choices)
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
