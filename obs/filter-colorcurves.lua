--Color Curves effect filter v1.2 by khaver

obs = obslua

SETTING_ShadR = 'ShadR'
SETTING_ShadG = 'ShadG'
SETTING_ShadB = 'ShadB'
SETTING_ShadP = 'ShadP'
SETTING_MidR = 'MidR'
SETTING_MidG = 'MidG'
SETTING_MidB = 'MidB'
SETTING_MidP = 'MidP'
SETTING_HighR = 'HighR'
SETTING_HighG = 'HighG'
SETTING_HighB = 'HighB'
SETTING_HighP = 'HighP'
SETTING_SAT = 'SAT'
SETTING_PresLum = 'PresLum'
SETTING_graph = 'graph'

TEXT_ShadR = 'Shadow Cy<>Rd'
TEXT_ShadG = 'Shadow Mg<>Gr'
TEXT_ShadB = 'Shadow Yl<>Bl'
TEXT_ShadP = 'Shadow Point'
TEXT_MidR = 'Mid Cy<>Rd'
TEXT_MidG = 'Mid Mg<>Gr'
TEXT_MidB = 'Mid Yl<>Bl'
TEXT_MidP = 'Mid Point'
TEXT_HighR = 'High Cy<>Rd'
TEXT_HighG = 'High Mg<>Gr'
TEXT_HighB = 'High Yl<>Bl'
TEXT_HighP = 'High Point'
TEXT_SAT = 'Saturation Limiter'
TEXT_PresLum = 'Preserve Luma'
TEXT_graph = 'Graph'

source_info = {}
source_info.id = 'filter-colorcurves'
source_info.type = obs.OBS_SOURCE_TYPE_FILTER
source_info.output_flags = obs.OBS_SOURCE_VIDEO

image = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKAAAABaCAYAAAA/xl1SAAAACXBIWXMAAC4jAAAuIwF4pT92AAA330lEQVR42u29B2Acxdk+/swVnXR3ulM9dau5d2xTBAYTSoBQhE1LCB+Q8hljw5ePBAgJ4QtJICFA2g9sjElogVACxqbFgKk2tmOMQca9qFnt1KUrutOV+T9zuzIqli3jAvyjkdd7t7c7+847z7xt3tkVUkoMl+HyZRXDMAuGyzAAh8swAIfLcBkG4HD5jyumY3ETIcQwp7/i5ctyRocl4HAZVsHDZRiAX6lSuvvs0gvkmatmyZPcx8lpslDOkMXyTDm64Xuy6K2b3LkP3LDqzLcXln5Z9L39wUY59hYp8x+TcsZOKU+n/rpYlsv58gX5kPzDcGD16wrA31T+39wfNV3ntthtywQMMwWk6xOxUVSIDWKPeFuYjZGLHcUJ/8iemJOTnOFYdrvcHnxUyrnHms665goUTAWyxwCOUUA6j1nRju5gLXwVHcOo+qo5IUMpj3sXr6qvcM80dJuROCoRBF/sr3fZkv7kcu7UdtNJ8rmSVPjvdQEPd0i5wCnElGNF65b6MpiKJiEuaRSBB6Ryi8INs8UDc6p/GFVfNwn4iVxblmRLnxnuAgLtYYJPoBMeBPk3WPl/4oq1PxbTTs0HLnYABdSCx0z0VHj2INT1JuLtKwnAlfDheYTxGez8lOSIG0bV1wmArzYsW2WDc3ISXEhwJEJKAzy1YbTXdhGE3Qe9fpIQy4UQTvX5A7nTfSxojmRIJI9qQG7eZ7DgIzS5V6C1/mMkEIaZMXk4XL4WAHxow9/mygzLzAwUYRZmYvyYKUg8IR1dUSAxJ4PEJQ65LgXCKKLrD3ZeiZQlM6VcdckG6f4Txebfuf1WNshfyjUdP9m9bNV1a54uOVgdlvGJMIlK2nwb0bnrQ3jX74Ks7ISTfxNw4kFpPWdtZskNd6SuWvi7Ue67Hp0g71w8Rj533wS5+q8zO557rmTVHx+ZelAa5CNzpCy7Se7+68Xyd/9VLO/73mi58oHZ8rOV18sPNv60j+1CE2XuB1KW/7L8aXnbe4/KG57+5aphALIkjLU+YIUNDsoRVabiFISofhv2tNCi8qOOltWhlNPF2AsP9PsPZF1ZLrBmRDNmJnt9rpuI2v/iJva2X5zoi380IzM1J8nmWHPz+lfLD1RPc3sbqtZtws6HVmPv69tg8USRasqkvHbi04OwdMbbRWWmiH1NglnMjDNGXb/4/hZx57wdwuY0XyxNkUe7TeEcaZFr/rho/AFpQKoVPpsR2+1mtDhtqLSasMrrw2u1TfiwsnHfae/JnWXvY9fDb+OpwuqyKriba7B9a9nM/3gn5Ddy8dwQZFwXWrAL2zAK4wi4StSjATu3VqF9TStgPzL21O0fLCkVya7ng9sq4xJCdBI6UpAcSd73+89GjN3n3DzYsbakdW9o2f0dNRHpyJlzC1V8//pqdrgRrWuE190Amy0VY0ZMQY51CtpeScAHexr2395Vj5ZWOzY/XxHZFCcramEzx8Nk+hysF8z9dB8Nv3tiUkmc1bTsvptzIyd1WeacunDPABpWtHfDvTeAPVQXtYnxMFgTaBo4YYiPgzQbY+csks92vILlgfbN3uv+NulXS1KumljS1e6Z17Wpaud/PAA9aFvQjWZs72zFx46NtACzsQrr8eYDq9BeXscT6JEUFByRe9lbupfa/N2GBKdASk4x3D7Ambv/c29wlqzlLuM3G9aUmbMNS/8o5cwfC7G29zm54yago6UFlGJIiM+FtTkP7nqgtswLc2fe/u3GxtOXZqWmGbro2XvbuxDs9KF4Rsp+z/3ZNZ/FaFj0u0llHVW+pdtvmDhz7IOb+9BQZUzER3vaUVXTgVC8AynjRiCa7URESJhSLbhB3tvx5PP/rFx3xYv7ogOtT8XqWDtsA7LUo63AgwA6ujqxfccWvLX3X6j8uApJE1KRPfd0jPjrAuC8w9cUN91zm9sWNRoS2oNwtoeQSu2U3FGPvMIDX3fHjJOn5DmyNtM4WNb/t3RnIc4ovQjfOOMiTCqeiWB9Kj57w411K8qx7p2BwuXuu6XbX19oSKg9AbbqXKR2ZyHNTinssB2Qhvk/+2yKP2ra3BoYSENdSwjehCTYp0yA47TjEBiVheYUG5qyrKiPM6Iy6O0DvmEnpF/phtWRhhzkZ4yEc0waDHkmhKMhhLrDiHiB6pWUgi/sOKx7/PDu38xNsKe6/ARfe3sHwsEOGEM7YAg3Ye/qg1//XbuYYv4YST95ek2fYHemtRjdVYlINI1GumUKjJ4R6G5Jgrm7CMkJ3+tTx63/LefaJFwGAj+tMwMZrYUYaS5CblIm0lNTDkrD5Ut2TukOm5PkMz/sQ4PV6kLEZIMpMQUyKw1+J33wMSkw5Wcimm/Bq/G//sqD70sFYOcnQDsidDWMVEpxMVICzUHUrK+G+2lqiRraak7XYd2jFeEFdUEPNu/dhU3V2/Hp3k/w/tYP8MnuVdi+/ZUh1eHy49nsiGtB72MFjhlIdYxFftE3MGH0NRiddy1G5X0fE/N/hIKsvlLNZsKClAR69UECNwDkB7Mw1jYCTmsqwvFD8/Lj4HgWjehDQ44zEclmE+zxJiQVWJGcn4FMjEQaCmH0Wb82YZgvzQaUjfmwIgtmwqRtbxssfg/SrMkYkR1Gg1UgfeRIYHwuavHqF75HuyEw1i+70O5zQ0RYb6sPppZqhLxRuJydQ6qjNBmLt5mL3/tJr2NjE/Lgn5wHE4GFPQRWBofP6DS0sN8D/cLhDgvGxkdo0HGoq1smRKzINFBVyni0GcxDoiHJkry4szPuvT5mgLcDE3PtCI+3wW2RNGl8CEMLgyZ3mr82APzSJKCldUpnIc7h33cwMa8EeWPGYMxJYzHtvBk45bunw+rn6O46PPK6E2WcJ5lSNjMKMdEBTLEhPNEK64xc2AuShxZfnCTWjktGH3fcVAWE22iHfdqMSloJ/naCi9WPoGOT28+5STAjjn4WMmhMGppIQhiY4KOjYLQgaogfEg3jH162ttIT7EPDWJ8HJ6UaYNm6B1t+/wrW3/YPfHTXC2havhnjsgqGJeDBStd2V2X7x5hcM51AqbAiHomIpobg8bbD0xpE8ahCROJdOBwr0JBvhU+2IZQUD9OJKTDmKJVnpMddiGJMAv5riBXt6mc+bGHdkwFfyEMkJsbAFKTT3k4B5OsnAa0EXguBd/JoOvbuKqSlURdHupDloM2WNvRAe12Dt8/35FY3HPVhPLtiAz568zM0E57WtGQ6WAJpZ502LAEPVkZYc57PZMd2/r0e4ReqUFyWiLMjJ+D4+AkYEXbB+1EDolWtX6DiM/YZ69as4u6oyUnVZEIgHEZnswfNe5vQzL+yLe8OzVR4TpZQs/WZE3TQoah4eR2Cq9phrbOQXqphAcRzb+03pM1WdPt4dRH9jU7BD0nHU6yOh1OcjTGBM4ZEw5PT5paI2rw+NHxW3opdO9yo2VmNTgLcRSynOOLQ3lyJba+uHQbgwcpfbxN352wLdm994H5s/sPzaPjDOmz/75Vw/3YHRjbkY1ThVIQjkUOqM/XkvzwxvfTRh3q+G1umbk8MjkSyoQimijjE7TUhOWpFV301au2fDa3SKZjH/7f3PhTc3ImTak/CD/3H4TyCMfQB4P6Q96eQmpjU9/LcLGy//Xc0Oa4FppeMwmu7g3jss2Ks+vQc/Ovvpw6JhPKNU+c5qi7oQ0N5hxFtQQdGT5yI/EJqkSgQNftgSOzC+vXvD6vgoZQXl/30xm2bPnjYAC983jiE063osEtUupthKp0K57iEIdd19V2yhKruqoQUPPWxfizFM3GhI679YaONajKxDSarFwZDGP54P2psvqEGLL9Nb+nG3ofGGBzIV44myUsO0Uajzd8paQvSyWgI9b185gwsRAYejoGGMqwxSnWNPGUbIjM8NBJOyrv+2yX2vjSkOHMxunAUMDkdHdYI/rVxHXwRL6Jx8cia6sQnwxLw4OUvm/6yZCO2rfYjgHC3D/aoQE6cHQ4Pe2ZrPTL8QwcgHcIVx49G1Qu/FNf0HPv7pWLJKekzG8/MmY5vpo3BaXEFOLU7G9Mjo5AdmXrQOjf8fkMZe7JdXCmW9D5eHWxGW0AZshoH4wnGpFSCgps9aYATs4Qav9H3Nh3mCtqJdFhCNAOfXAYsHUJKQMdFsuycE0jDp31pSElJRqErAeecUYBLf16C5DQTLFTDcXF+pGSHvzYS8EtPx2pG4NR4WDZFKUHSRDxOTR2BKcnZGCHjURBOO+j1v3xSls67RwZraQfduUAU9f993HhcPGHMmGgh9dR4VzaOz8zBcWkn8h4LDljvqt/LsqbGlInr6jov7v9bbbAO6+hsfMRtDwWpm45GEm28zHzeb9TAul57Dhdv2IVot/I/uLXymgD33QexMJquk2WOMZiIXAygoTshDRVhI/ZwJBQgGRERhd1GnyjkR92OPcMAPJTyJnZPKXClrx6bmoqZGQU4L2UMzsyZhkkJ2Qe87tRfP/3Ke+Wrl23v9q1/4m4tJ7B/OdMp1u5G25x6BKJ+Wxoctmk4DuNw/iB1vvuYLClbIt2TEzFxgrNwTsn9zgEWvcVRDLOLIGKH15ODjUZ6uvH8zs8+48A6L7hBrHVYMCedjr6T1zgp2H8wB7jk5P3TELijtaTsx9IdyiH4UjBH/EUMoCFgyoQ1NqHtwA544PFEEaSK99AM2Lt977ANeKhlbt2zp8oTHpmLtJzf5Bv9rnznWKzy982GmfXCg6WtNQ2nR7oipfVbGgs3l61vzCswXbfpD6cuOVDdV4oUlU1ifEXW0AxLK8zq9/uyT+RcewvGpXfhyuIQXLYgKsR3RMag6j7DBoNLJVRQC1OadVEVh6PaZhokiXva92NZNcZHb5blkwpQeKYK1fXK3pe3y7k72jCurHHLlW/WB1wXnkAa5g5OgyPxRGQUT0WGbTM2B1+h9LOjM0oblzTEW742+IM4FguSD3Vheuv/LC1NPv7km9enJYyuynOkNeTBUO2pQMX2zairrGgMNgZ2bnzm1fvx2arlh0rLWilLaSrdvKMeo/2VcEWpRuk4IlOiMyWATdEG3D/+J+KA9conpGyjvN2qJE4rYjHAqEpdJCvVHMSFNx+4wUvvkKU842ZHBKPPGA+XbououcnOt2uxKS4F9592z4Fp2LlQylEzgR20O7cbXsM7655HeeMW+H0tyC3KxJOz1x0S07+shelfSQAOl2Nf/n8NwP0an0Ql76yQ2YNOyQ8yOvzAwv+oclQBaCTIon1Btu++3OzcXPpeFTXX1Kjve4iStOtlZBiUR2PAH1AgHiu+H1EA9mvkPpClcJ/JD8r4V4u4aT4Z6Ai6koF5bKhLnUhzqqkJeKidIKQPF63isb19QRn9siSkYMM4JIbaedAHkJRf4sAZrC9o/9oTY77z542JxsxPetbQQpvdA4XBUWvPYQOwl5Qz9AbcGJWhxM/c5uUBaarB8fpJdL0NvKstGkuXI68Aa0SBiyDk5g2RJ6rl1TTNNwOLPwYatvM4z1ELLnxC2fxHuXN7gW5fu5DGvfJLk3XZbdR7UVHi07tMORNNamrn84FzLMEoNINb0Wwza6FJ+yR+H0WKKQTmkfQ0i94XZp30sA4+qRNMv6q5jnyvZIt2kf5aHvb0A+SRkpBfGIC9GwotJc4+lfsTgOuLKOhSVB8i9uAAlRDi58lqTj4GrE69n9jolhbgRYLzUo7KNCUdeV00QQdoWLu+i9f59pAB7wOL1gDl7WqC7CgBsU+7EpCJcQTdcbFcz3nIIQTVSIrTe8+snxnWxAYiemillc3bg8XYyAFTxk5r6gVGwlqJ8aMk7WKDhQM+4ySgiNt8fk7n6BEcK1a9P/wk00eSoz2zhubPm9TTn0og+HmOj0RH2UfNuwnIbewDCoRo5RHUTIcEwP7SLpUNPZ4NJejmE3QuNtROiZamj6wm9kWnm8RTnS6uIMHcohxZaOOmh8t8epcpxthiSOZGqWmYqEnP6wnKAl3eKGQ0qUSUd4GFbxCILUcIiAOkXRHl3On8/3jMRzbvbWanRAlHQVoFae7mtx7K1aam3yyxKw38U+daEeIvURUhJhi3EYzvE4wb2GFhTYqznuiRACK7pEdCZ0wGEs8mC48j32JPi9DNGyWTKcE6yftmSrTFNewLmjvRJj0QnKqrZPLekM1ruM1LYz9SKBhYuU3qwGVdfjZXUjM1fayWdVMjUTB4o73AeKiS8aAA7D+6CC4XJZ39dNI7gQ0l8QXKjotoAqCZBHppuzVuIYEbSWA5v3cNdC7Qy/PtMZpEfydFAXw6Ac57LaBKL2Qfp0c0pjWRmRUE4cLXCUT/YQCxdwdiChLxTfbDcbiehqoGfGNMwjVSilViKx7CDn6uJLTUHT267nLoIBxBHo3mNWMpLXMpLW2xlfVWHu1iHT7s4rXvYxHeRjmvqz8cIPaS1I4ZwMSLgFs4aDPMmmmTwB+6yHCfklrr2Beb2BcN+3f0BjiH/M9FANoLWf9Yfp6gm1FsooO/petWRzPHoJeSsXEt61dmUo1W7yGZSYMCUAfePhWrbImTdRU7gkRZtOMJQpsI8FXrDeXWUH0ERHS/+2dxVBddSCAS/IVkcrquPpqoDiqWEYgfEIj8Xi/UiJQyOkSpF+tAqPnWS3ALphOEFt4vTGlnImiUJVfGdqwiaD5j/R2xnPfBOq+vdz+S+5MJ5hMJ5jyCWfKYiD1zqQnbUYFXsBCrNZp51EsGRQ+VL7TrskqBYmqhW2i2jJOa2dNIIisVKN7aT18cTEIN5rzkcj+N/c97XT9ad2ZIcJrUTmqmWeTdyvt8SDOJgqecY9M9lHv2AWB/aUe5mzFNk0DzOQpc9F7tYf2mqlFsVeVHbChv2rCtnyg+Uh5rfyASgEXn60A0ak61IrjpEzb6GeBeqpjNyswcbAT2Ap6NbnkWgVeMEoLPRmtPAcTINrgp496ntFNqs0q1RzTo5oLCtjwwsI3KyvtcndtkBoFYhLOwgNKxMBYI0GpowscE4HLcS4pjNB9IGvbmAzVD1sXkwyz2C/ukgH1iIy/8CngE3cKVmp3sPhJ90R8TCow53FMgZJYQjMq5sepgFJrHFRsA7I+HVhMXWzXncVBcqP7Q7Dr1VCBd/I7kno3LpPq7PlNXsUJz+prpQHjJrUZKnEWq071DRPqRBiKlcdFFumqWmlqQZPrWt4H7XtKSVAZIw33qVq2GupCgOIegSBEFtB1sNHB9MTX7HqXdG7Szm2PtioGOd5X8Xx5A8u1PFmp/Ub3jTJSuJbzXbDGfMCxERKbzmERAbqVKvg/P023piKllr+wnwdl25ZTZWVHWWbomIAgKIloCto82deWb7I9/qTzVo+ig7S/iQdvfXqJLRqppl1nXjKSri3a+r0JX0Ws/V9EaGFmVQTfBVFAhXaF6hkDmKVJcnw9Bh0Iq4zNBQnZR3fmU4Uqj8yECr6HyC+j6owHEeHbIt9ghF7BDUrQOUWEd306q5ScpDT/rkYYiNtNEUoUD06huLxO3YrwsprxRT0CKsuO340OCYCklUlOsbcrhSIC06gELp85zl+4vioOEAH1aMAMhba9S8WWoKxZms7LjziIALyL4XVDgt7I6D8pFOV6iNFylaJYxaagaqrfVQbU38XLgVqUBVH+pzqPtu3UNB9xSDriGowi8ofoGk7ifqQsu5TwqYaZNkQsKLuHdA9m4XsiHNko01GoYahJXpbsuGNktrxvd4c+wweeINc4QG/dujqwqcuOh96mCPoXoCMaknfQqKfplT5v1BiK9tqzLaAudSluIdI2PxpxTsXWVEPe9IJU6kj6RIm2YjSJ5Jm6lVzuBrEuKSaiNiY14Lu0+7E5jU3M8ENmpkKnzCLp03b2NaoNa6AELYy8Qyn77qB6L6YnLhHUwKk+lrRmi6WFIN513tw2ZtZm41F2EU9uuh1Gmxh6JKLGFduG94h+Uho1oVJaCTcB1sZTF9G5vcUCOj+jRABJb/hwH2baDmBzHonwuGTUNkw6RQceo+BREbyimGaeiIyQ6zaCbHh2wde5wWt3b48TD4s1nnt8a6YqkR7d6ndEPWgydnzZgT3dt00eoWPRvUV/eKBs5uEJqdDXwDh7ZKzKumZDRL3WaTANirOGObwCTSiFvy1FSQsAaJ+GhR171j9PxwporTJfClV4gwnlZ0pybiOpCA17MimJVCu3lRLbPwr2FbTGpsFm63sQmLXSpcl1CevCoZ78/APbY7EKXnAqs6glEwqaFmqIUWlF6virs7ldmGyVyuwtXuB0YWy0RKfcIY029rG8sx7O+xVPfA75LD3S0QGFIIpEVeVsgKmhiPEhbrzwEuV+VfcxnioSaS5BqYPQIBaMW1RGT8kVqZonMzZqBwusLkJNuGzsC8vz0KCbbOkwJlIDP/uutraFumVFtkI7NYWFYt1ug4g0y6d8hNzxd7JSWsBC1bikrHmKbqb+rdV+je79zt8cClEIYhWbParqwV8OzKLOmXIb4yWchY74lbUQqrijyh07L979jzrA+i2R7mzdR4B1KsOWGKNoE2xdRq9Y9kOGIBiyfQZuYUqEyN9vcyja2RrVjHn2yarBF7SY9HmPS1bVSKC7Wl8EvSZSq6WmaOk/QgRmnQm0u2KUDl9MkOpvgTgjIJNnh/U64vum01ZWwPLEnXbRX2cJoaF4N330vAOuovnYrYtjuiIyJ3WMnCHrA1ssO6TWv7+BeJREX8KRRGRKFC9j2TJW9KIrjMorPMtiOp/F+XLIhmmVAZ5w56hbpN5xxQXicc15bXi5ti9xMROlhGxzCUGuFfNMo5dvsW/W8XOoOiAA7yiu1UHIdO6iKHVTNDqqN6ibhgeJMCiNkVEQOHWRS9AoV7ieRQdi1DleNzqEwLMyQcsQNNGGLTzzPkXnl+VZbQaoFIVpT5gQpqnaF8ezTUd+asiBNic5OYWisl9HaRWwHaa7T29ADtIPGzIbujuyjN86uAdAVo5cd5YLIu94gMzOicJow1Zo480pz+qVjDPaCoESYZxgqI6LmhQCWrmvpfA91WyBq7jXIyvooajlgVFi/XZlER4TnBxrkA9uSaNemDfJJZSG/j+AAy02LuRQizkirm4PLlCHGGRLFeVFDdDJNElMnlVWjB/bahuT2mnJTWdtizQlJZIWnoEioUEFxYpE0EbWyMBHGIgP25gu8mR3FykQPOi1sqCFC6tK0J4gbdBXVpUuIxmagZjE3HZRqwq2lR2IcSof2y5ZRHxP1mD3HDkbweMb1/DldazA7VcbzuNGOPEMmruLJJ4SEMxqSV0SD3jPbO/2Wt2qt8rUKa7evvGUVah56AY003DuVJNkjtEVt/b3cIybN9yM1NOuBDZOxXrRkZSM96wqMKDrZVny98dLCNJyZI8LxqXjbYBPPSpPoeIf23T8iHtFhqCfrOUKCEY2vLWTyXvK8jrytiWpBCcV3tUI+8kUHUS/+x9tjE6QxsOWSx7k8lkOwZejSXPHdpJkYQj19TnSpZ1Igtz0DpY2JOK1GwFYeRaDCI0K1DahtKZdr5UKsocNXj0YRY45Uc6800o0yCyfQfvoWgTiRexPvGmVnGu0CtWlNeDNvMVYWeNGRP5tAsNBUitJTJCPMaqySiKhVc86owmMJ6gF9rkoxqpNc8SzWVJpHt6kadcO9p80ZuqGvAvnpbKiVDU1O03hh65lCN2iShHaaMn2lmqokby3dmbjQn4hzWgxIa5AiWumRhvJ6fFZTOeOp5heu2um/tIDDNSSQaJbwU9ZVUp09+A7E7ihEnWZLRaLHzm4yxuzWeESz6ckXq9hmsqAnL2ElB7zbJlp8S69x4aORIxIRyc0QhhGJciet22fSPSizu2M2qzDSU5cJmm0pfVo+R7fu+LTr4FQ8byCj/To4o7qD1NwLk04dbya9D6y62ZCs8z9J/z2uVz+H9Xt2k31eA2QL3f3ap5FaZcC5FQX4ZtX1cDSmxiYtzVQtLQTcSizEK9x3inr6fz7N09cdpz4BWogsnEQAXqCAKItiMaxoLEjbjBo04S38E2/FNaIjgy3KIiMKid9cSqMMEpyqAyZB9xYVo426ES5ItJFEh6Kah2jA5+uiIjpzTHpDo3pD1TURn+YIdOvM6zJAtJPeJq3Rk2szcGXtTzCuwYVwM8V8pJ2Y34JXcS+Ws8EhuvcchxdJUXQuvUlWTG9SKvg2baJh++Ix9CZ7T6Edr4dWxtBpolrZF8tcCXn/UqLFr3BxBXl/Bm4h9ycgYnQgmNaCdzIfwssFFejIZROyriTPU7Roml2flDbojo+KIxnIv7DOP4PuRIX7mu37/IY4fS91oEV0gSJ78b+X1BUVTZCVJLvGjoRmO74RseNCXEOLKJ+3sLIrqTVFBd4RC7FCUuLJAdOPA6bi+gIRWTixB4iiECZKHQVEE6WOep7um0T0W+zg9tjQUpE2BT4bZJKe+acyAJ0qjs3RZCM4U/R1lj3SzNQPgD1hi56nUCip2aFLzTZtBBvaDIg2K0fBjixpx0WU0KfheuJ9TKwywZPWiz34h7gXVVpMTQipxwHhmMhOv4ydPp6dzgrTTSpCx05fDdy3jOq45ijF03qHjQrJmEso9WZwMBAu43Xx33c2R9DJkLEciURMV7FLeSsKKAzCbG881Uo9+f8MFlGVkTdxxG8qhUBGVON5Ku+TSp6nkOe2ND02rIPL0iuVp8ciCPVLyupxtDzkfzP57+Y93LrzyU20+Xha8z61dVoMI/MxWuQjQvNMkR2RW7Fa3kchsId/g857DzoXPACIx/MmFxKIk1BI2tNjwsoomgjECrxBhL8rK9ASM4Z9PWlH+ptm9pP9HKczYn+lS2cGetuNPj3aoUXgVZrUBTFTYT5SxAj1tEvy1oc6WRmbY31j/3OsPTMK7Iass/WZlGwtayQ2o0BdXrkCWPSWlmlz2FNZ/YO19PIyLuB9S4D5FC0FIS1w7q/mfZcDC9/ez3z2vtmbRH3aUElDmxgfsyC75Tb8W/4BL/K6qpgH5Y3Nvch9o1zneW9+J+mDX/QLnkd0ez2qAzLQ326HPpfdoyVdmEYsKHNtuuw7xfgp6XmZ2ufTg08xHjQbZgAQlY14fi8gRmK/NnI8VHI0LopJxCqhd57QgBhr43492oOZwprQ0KSXLTaFdjqlwNm8fwEbLXl/NU3mxVbaF/ex0XvQeuAsk96SiL2TNUef62aX5Otzqj4SX7VKn8usOsRZn/1NV03g/gx97tSh7FD9PuzZqpUE/Gva5P2gkrdP4sQMSsNv49bYdB7tRfaBD23k/WtiUWzg0b6KtT82fRgFhp7FPci0jkF+PvilhoGpUhNGU0mDiX0QirW2iaKoAsugORgRDClGOeR8wAFAnBGTiPOhlhXG6/lySgp1cix+gofwATvtM3ae/9CTMQfk56VSzM/k/c5ko4vY6KgugUNs9CY29gWOtm0HH20HyipRkukUApESKV9NfVBmqCCojzZi43sEibIVfRh6NoyyRY7XQTeO3+P1NCklaWnnVa1hnZR65Yei8vvMZZfGBMF8QrKACsMWy1XcSyC+pGfZhA4v3Wu/fT5dd1CV8EnQJZ4CXq2e3fMO7+s/tPseckZ0P6IyCUA7zuN+Gu2wRBqfamLfQDIiNEAbKBc36JnBO/uAUR40BBBPYKts5BNZ93TWna7n5xl6pTSp0bb20FOaBgPicWTyTALxRD3LRN1PavMeKipduZNScQc/VxIsjXq0sMeET9IsXkMxr5moT8wnawkEaXr8RcWoKjfoSQOVX9DW7MP/UbzlbKrlGVTLJvZEgLdRg7KKvFlL3nyoJOLnpoSSiipb5JAGv42DX/kBp8UiI4XU5OkxC0nE8rwr8C7v8ybv0/LFAP/FU/L7E5qnZxGfRLCoZEwz4RjRMmlJsAbG3QRjBcneHXu3n8YWX29lpYLo/DZBT+rMZj0m1hPWkzqDPHsbr3+bql6N8vDhj/L9eKc2gihrFoFICTY/S5vKsBk06aViSr6gvrSgXbeY4vRABqWcwaRlFKVHtd+aadF6Va6kkngfEnhNOvC01K7DyOLu5U0TIBNxLtVycSx0lk7eSwKlMeYobqA2Wk3u7yC35UEFgDb442L8t9Pc0gRLNntF6PmMRgKvnr3Y44C2HWZi7ZFw9Pqso7DGMortdFqUdJxHWGogQsxR8MfiQiH+79ed3dZ96ew90RutHqGDN0TwKgvzI4J3FRm55XOb7EiltQ/Wlngt6zuW+0Y1Oi9TS1OPkWvUXaWo/l1iX9TToELAVK1N2/S09fKjmD3UK6M7i2ApojaaT9vMFUusRSyx1s+h66FUbKbWWBzL6K4m2fqinBjk1OhJ0wd/Ma8do2d0x+uDX7KGEPldzWtVutoHhw+8IwrAQaWik41RKno8wTiajcqMrSv7fEmWSd+k7niFekViFOjKybBP2XGb2IGtR3dhz8E8WJVapBZeufRQrUkHX48KFrr/XgvNUOw8hktK+6hlQ0xq2TErJgjmISUGrcTYgDbGTCNfTAx4sW9hTmzKWss8U8lpNj1FzM86PVAPlN2sr2lRC6y6j/CalqMVc93vssZk7lUPpuhhwt5vNIjqUYBWaEqqkY2NHFvQDQGMh+JRHvNF9QN4nkVuT+Z+ir6qL41/ll6D39grAhPRNZI3xn/NXNqiO5ItvfphCHbkVwKAgzDmkDrwywTd173opsTnYLQSjBncp+vqVvTKJOuJRTfEongDB/9RXNd8VAD4TyFKSfXN3fPPH703J9/1ktOKDcVjcX7hKLzmsDUiZNgJn/l+OW7i8mGoHAMwJhKM3kN8skMKQdfyNXs0xytCzGULf2OYDJePrmTbyHMx995/7Wu02PZqKRxJp9NvLIUnvhDBuG54AzfKU6YuGYbJf+jgOFIAXPm4WBWIv2hmdyJxZU1Do9mO3QYTHjj5hv2OOrFpXcktbaZ7Q43tM9vL3Zse++l3pwx3x39eOSKP6F2zRJSljLlrZm7JtXAd/03EjZ0M59hxSB9ZNLiMn3zS2ntnzTi1YO+eizNeXlPwAyE6hrtjGICHXLZdIFaNGn/P5KJRJUhJz6Arb0anCMIT9aIz0HbQ63/04+uW3/PhQucMfr5LCPdwlwwDcMil+mdibuL8i2aa8wvhjQ+hJlSHrd5dWOcpQ0PAje0dQ38x9/VSOiuA9QPuQWG5jdubYb/8Z1uzfL21Tb7Vzs+tXvm3+uZB7YfF7/5eLvnwDnnPO5dK8ZSQ4m5ujwq58MMr5RsVzw24riu4TjY3Pil3775Rbtgk5OsbhHyc2+JtQv6lUvQ5/7xNYu6fy0T50t1CPrpHyPvKhfyDW8ibqoU8hef/aiev5f7XLwr55weEfPEPQi67UZQPlRff+0S4b90sBn2G/g8Wi5JHbharlv6PcD91l5B//KOQNz4pZOlrokOsFmVig5g71Htd9Ya4fcEbouy/XxIdV7KOBY8IedfjQt79FxF56jHhfvmJU1YtXyhu/0oCsPJ8PLCHzsbG+F1YE96M1wMf4r7gO1gSWo3ftjyN19pfP6T6/iblhQPuAYXKAD7x+NEYNiIQTUB3VL16C9jbOfjLZuq9NVhYcRd+tulFQD1sMAH4Xycwmj5QcerA16VbLO1wukyImB9EWwhoDmlPvY+90NI0Y995V5SLshXteHhPAwpVnrG7FWjv5OYBuruAtJD+2Clufn6vbdVey+A1ovCNXx+8Ix+uEXN3GuAyJmC/zLvgcVEW34k1reWY6bfC5TfhyR//WIoHrpbClYxll6RiMpLwsGg5sDZ5okGULt4hOkqycNe0PEyemgdHWhqQkoXrfnGtFLf/SBozRt92h6Pw/HJTxrz/eeRXR8dE+sJPyX93nZjbbUVcU9fLaHS/jI54oIljtsALzAwCk+TJEJ4Nh03gxnAbNvhDsEQExpvj0BkW6PIGUBsK4O6WTtw5yHW/3vWgNrxUHmYmcJtjBqa7LkeGPR8JYuDrTANRCt+oB74AwFshRa1XM6rJgtmQ3dobIP5Se1tHSoijoRnXPTBHLil9TJR0ODFvFDuuwIyrR1sA9XKnRA6OOPKhMI5V8lgC+ZGYAqTm4f9Yzd0Ham+XAb9ZY0Ljh8V9B+Ov3hWldXux1NYAg4HAbkoFwqz79tvkvhfzPHKyvObx0J+vvsychue6/uoSbUIly82RKbJPuOuBVlES6cbSDCcMJpUXxvriSeu0ZKqars/PO/uU36nohBahuPShr5YEzG7DglHsrInq/WiUBFNrgBN3AHPKuFHZTF63BieUHT6BLd1BhIwGNMcZ0WyQcIswmowRBI1Sy9wfrBTPwKyTbsTNJ/wWt4+8HYUZV8LlGIl4gw0hj3fA6f7WX6J69/1orAWsBGAmMZdingwR9BDwG/H7zad0xHf5Kh8aIzMkwaeuWf49ufa9OfKaR06T1+QYsHq8HZjB68bZtCconTgCOH40kEug5PBYuvPyuI4PHxv0Tdm/2y5up+RNkxNkn9cz3PupKEkkYCytMCSRx4EGoLwQ+MV+3jhrNRdiIk7ESQmXEfmTFYOe7H9OssTTa7thUC/Y8XHAtJO2EAGdmvVdJOVc/dCfd4rSr7wNOCaEgiLKz3Gqr1tI/KdUY09TEnwMTGeDxhi1h8ocbunqZo+YDHg5GsQ9/nasDPngsQh4zQaMTBj8fbt/mHY7fjjmYkzKnwEHgddNqddFve3t8KK9oWXA+UEeaif4gs28Z4e26tnXvgldnSth9G+CNbim8rqRDwwaKrp2nDw1gwI6J342MilNkqOI7dXDUlKpGVLIK6fxdMQFUy4IrH1tvx1c7cf/1UdjUrJPsZuwzGaGQT2fbiybnB3Qlmbtr+xGG7agDh+oCfXIJjW95hBNos9Lwcq7UZhHiewmTQ1GbeVNwKJWuj+NuvCThngblj5wjED4xV9U0wWHmqixsMMydlEd7Kad8zwZfRYZfsm1sMyciVDj4b+xZ21HC6WJQVt6HvVhpXoDusmODTKK2fbB38jiTE5HiPrFEI3C6ciARdppkxngpWEW7w8NOD9Ci8mm3hfCzvD6gTrajS0qMzVRexbZZVPlweOUAVxtMluXCd/5kP7XYAnPRmTvS7DRi7KP/wVMzXZID2lKNyoJ2kctPrpRvOK0oPaeQtlHRf96j5ibGoo9/BPplHhRykbTv4GR7LlzUwaScHvHRqKTJwQWf/50EImZvc/5pZ4rpuzUy7kbYdSe5vRSi3bs5jgYgp1YetNbYs6fzpbLv5ISMPYSZ+XXKeaS6IypgOM7dAyK2BjD49jRtRq74psOP8bY0goj1fC1CoTqFZP8t0F2xx4s0J1oHzzO6Pci5G1GXCSAAmcyijLykOhMQtCUQGDGDTjf006JR0fC5tCWTtHEjK14VflX2c6h0To5Wy73+Z9+tcvzGuJIpwy+hG4O0IhaVxbdAF/DGnRUfoBAR6Nr7+P3PdH7WtqQ35puVk/i6DcwurCgg3SFyGOzWqdG+nx1lNRqIenmgTTMaqMKqlqsrbpUADRqYBM14vP7hVARW3NEUyPDptmSLymzWLGT9dfz2KXH32mYPfOnS1fUHl/61QRgkW7gq4ltEt/CLXg1Pb7/BZ4b8yO8fcJZeO+EmUfACGyDKxCBx9uFy83UP5RqI53OmIfw2gHIz3TXoH3TX9C6/UVEWysR7GqGIcEE64hMiHzXQOFl0drSSKleTxUcooSxsEOkes5YaOjkjsyXF7oD6FR11FGidBHAkk50p2EF2sViNJnuQ9Wua9C1O3RVzzVlz970Cgfy65eNlgPeCUdQji0gnx1scnw2WT2ePL6ETgjtyxUrBt7/ps58PBudhdt4/6vpgZ/LgTVSS1z8/OXEEvfEsmgp8R+g/f7nVh0Jat1/OvA0ATir/U40J+QZ4nLmL72j4uip4y8OwC2x1R9a9kRA0+UWqq8E5+0wpkzFgnATFuAIeO4iivRIGDPocJzAbbYpihzlqpk5vEXXoJeZ3RuQ7VkJc9MiVO55AB/tfh5rKz/Ejpa99NYHOiF7/VqKfXtEhXdYtbKL1CMT1Ou4QodGclM1rlY5d8rDtFFNWnLY/1msjwDq5sAN0zFZe/fthvVX3h2LDcYFk755xuUDQ1CxgSQQp962nss6VPQoaQydPpo5dWoMjRx4/mhKhZH+93Eh23ExwffNSuB0ainsQM4+/BXSiarEpljqW0CXlCpBuCdDXbWX1z7SdgPeav2z4a4Aln71AFjFJqgeU0mN9ICdbGT6TjKqchcm1zTgT/VtWNQaOAIA9MIpAhhro+QjAGeYgjTC6zEZjTg3PLiNGWhcjAQyNtypXkCyBsbwk/RuvQjSywhGugec7yVYWhXjCbxsdnSI3zt4Wq161uwhjqMLL5fLC+LxVAFttizW5czkgKB0DfO7l3svpcyMt+9C+vdzC3ctv7O8K3znosHqspIG2oawqmX6VAAh9aBmSr+5lEmP/QlY+rqQ69cLWbV9juyo+aXMdaQih7SrVwaPJKimk/7ZVMf/qEEfu0POpE27A43f4W/fVepaqXTFTpWL2axtK2hmfVa+CT/ywXDXR1+xOCAseB6JxAG00SIfVPO7xMuc5yFzn8fonFkwx+WqB3cfUjn9n4vmvnfZ/H3ZMfONEq64MHLNin8RBIxdaPO3wWaIQ4YYnPyN9MqtlDT1PCUueTLGFdAJSEjF7o4ONAQGvtC5K24e6j2L4aS9lKxevUoJ0sHx06xswcihsyflW/KartfFuZEgXArv6vFA0qI9s0BlqgbxC551LkzWFbZpP5A3DSrJQ7Fn8scpejoj2utgzVTJueRrgPuZEwYudU0suHdINMpLZMZjL4mOLgscucGYHEGCRQu+q4dzeHkslXTnq9imAY7HXxN/uvb8wWk9thLwb/LuPfHo9tJu8BFnwZNZGb1+650k+odUE/VOjCv3HJqwe+q+J94PBPtEPIstYVgjPgqmTg7hFiRHOpGtRK8woMk8+BvVf505H025jyJ+wisYMf4xOAvPgiFzGvyuCahxFgw4Pz5pLJJTb0C3GIlqPUqjlrQlUCpWV38xFlHDXdwRQVRJU/o/GEkVPDlrBiZmTI69uScpeQVS0nHHgeowCmwPE8ABv/aOBKVxrFJzLI7Ea1m/N1s6J7rRWVILnMN2nkSVfdwOYOxufqZUHEOJmMDvciulVQW+/5WaituUjRurqVKaqVK6pmrJtSoypxbupHVkIs0dP3TwrXymBN3+q+j2PdX7eIJaDdNaj7bmKrjrtyDSUQ2Lvwm2oAdNXS2D1jc/dzpyUoowKaMIuUkZCETDaAuqtfJhjLYNfKt0vKUVyY5upKUnxRb1JjtmIDv1Oyhk27KTvhh/cr4l11KAPqVklHpbT5J1HpISzkWquQAjcmYg1Y5N6VPlAXMhmzux0O0GGggGDx2GEJscpMZpbtXeOHMkymnfk87cLnQW0/4bQSC6aE65tpB+98nIqbsI9g0E3/tsw47Y6pGvDgBnf1suqU3D6lqnBkLfbOhLRim+dy1BcNPzQ65rst2ygr1eJa/9+TW9jzuM8d1d3lb4WtxorN8GT1MlvdrNMLe9i4j7hUHrGxXYhEDVe/DXbUDIXYa63W+iYdc/keBeAXvr+wPOT7X+A5lpS5CTviEGQIttA6ypzyCLpvvkCV+cRwUXymtaq1Gh3mMRrFmMyO674N/8MhpXbojSNJ13sOtPOk0uqa6nc05gmCiNbNSTwSrtUaG7hmiV/bpcdIgt4okDnTP9FulMDKIzmcoljbZ8Nv27lOZcpNQmwtU8EunsyqSNiH6lABibL5wlT22MztrUQlurk16Z9+d0qm7jvngWuk+cddDrF3k2ld5e80HwG84EyNk3DUggTE7IrHWaUuhAJCOuOwGmgBUGfzcam+7Hy+6BwuOfj4uSpX8X5YWOEGTzneiufxhxnR8hxfMvFIZ+jAnRnyAnONCMOa7wRygpeApj8mbE3k+h3BSambBycGVnHx6PJsyXRdEAoioe2O3RZl0sIbyed83AsMsghvrcRIloBlVMKusw07FSESn3QVTwC42i5I8EX1MQ8XKCvOZg95n0K+mknxe1sv1Jzotgq4sgbocRjubxsWdvxa/ZX+TxSwagKhd/570pxtyfrvaPvAF76Xxspde3JeV9VI7JPeB1T0U2vtIeblpmjwus//O48/Yb7n1n16Z7guEEdFB7trUnYvPOOlTX+dBC2+wiGsu3va3FqF5fJUpXrx61KmcEVqelo9YkF2Ec6cg0r4HJcydceBp57Mlk2lAp+3HOWypvRL37KnhbN8QeS65cHo+a9FeZLEcgaTxiwP91sD4Ptb/MQLfz2v2HXfZXrrpULk80Yg6d+Kg5pL37bB358e8DuJAbOsSfEruwepwRgQfGyT5QXfHZXR3vvnPnftPDhAvX26erJzAmwVqUhYRcE0xrtqp4dvRkKY941rrpSFV09rX3nPo/94q58bmzf5OZ+VNXcfE0OBOd/eYp95Z+Av/pYRhLLfAW2oyBxglO23WlhpMGtYPun/OzJbcuf3icA8b/bfcGEAllIGxJxmvRn+Nc2m1mQ8eyhavVI9hjd2ikozznW+fK5Y8/J2KLDdSDZoWKU+qv6Iw9J2pgFAbeBkomSpYukzYFZ2SXmXh+N68PhA6fP7lXy7vdK8QPfB4UBppwY8ohXn/mHLl83UtiZmcdlrX74XrUq8XrnmoXt1+VpE3fLW0QpTJMoEbw7Ux77FEO/++0nIFeqz94x9U+87VLHn9ZRAw+bE6xYOEFeoJFJFk5OSNh6AhAhOLpEZMhs6yNCU5cfDTCMEdlVdwfq58pHZ/qutkVlzA615yUZoPDoPzhauqgrdFIo98Q2un17Lr/1qRLhjzPKB59cC7CYsFZJmPBSot0oDAPV6cmYKol3GgLNa+3BKt+e83En+9TabGlvLNjkdlYOtbN6kUiHA/pZu1BAOd8q2/4YtUTQoZUdgi3VkPs+fXw81yfSXs0450nS3EkeFP7nCjLueLwJMmjz4vSH8ThZrXq9+8FcOSnUrL6Ys+U6/QHUMkeff6nk+TdB6vn1jdFSUI35mVEcWqyDzn2TsTFVm2y3fGBuY1Gr6NBtmJh9j33HbVFY2L4ZeTD5csshmEWDJdhAA6XYQAOl+EyDMDhMgzA4TJchgE4XP5jyv8Hk/SZuQDitfUAAAAASUVORK5CYII="

-- Returns the description displayed in the Scripts window
function script_description()
  return [[<center><img width=160 height=90 src=']] .. image .. [['/><br>Color Correction Filter by khaver</br><br/><hr/></center>]]
end

function script_properties(settings)
    local p = obs.obs_properties_create()
	local pe = obs.obs_properties_add_text(p, "text", "", obs.OBS_TEXT_DEFAULT)
	obs.obs_property_set_visible(pe, false)
	return p

end

function set_render_size(filter)
    target = obs.obs_filter_get_target(filter.source)

    local width, height
    if target == nil then
        width = 0
        height = 0
    else
        width = obs.obs_source_get_base_width(target)
        height = obs.obs_source_get_base_height(target)
    end

    filter.width = width
    filter.height = height
end

function script_load(settings)
  obs.obs_register_source(source_info)
end

source_info.get_name = function()
    return "Color Curves"
end

source_info.create = function(settings, source)

    local filter = {}
    filter.source = source
	--filter.width = 1
	--filter.height = 1
	set_render_size(filter)
    obs.obs_enter_graphics()
    --local effect_path = script_path() .. 'filter-curves.effect'
    --filter.effect = obs.gs_effect_create_from_file(effect_path, nil)
	filter.effect = obs.gs_effect_create(shader, nil, nil)

	if filter.effect ~= nil then
		filter.params = {}
        filter.params.ShadR = obs.gs_effect_get_param_by_name(filter.effect, 'ShadR')
        filter.params.ShadG = obs.gs_effect_get_param_by_name(filter.effect, 'ShadG')
        filter.params.ShadB = obs.gs_effect_get_param_by_name(filter.effect, 'ShadB')
        filter.params.ShadP = obs.gs_effect_get_param_by_name(filter.effect, 'ShadP')
        filter.params.MidR = obs.gs_effect_get_param_by_name(filter.effect, 'MidR')
        filter.params.MidG = obs.gs_effect_get_param_by_name(filter.effect, 'MidG')
        filter.params.MidB = obs.gs_effect_get_param_by_name(filter.effect, 'MidB')
        filter.params.MidP = obs.gs_effect_get_param_by_name(filter.effect, 'MidP')
        filter.params.HighR = obs.gs_effect_get_param_by_name(filter.effect, 'HighR')
        filter.params.HighG = obs.gs_effect_get_param_by_name(filter.effect, 'HighG')
        filter.params.HighB = obs.gs_effect_get_param_by_name(filter.effect, 'HighB')
        filter.params.HighP = obs.gs_effect_get_param_by_name(filter.effect, 'HighP')
        filter.params.SAT = obs.gs_effect_get_param_by_name(filter.effect, 'SAT')
        filter.params.PresLum = obs.gs_effect_get_param_by_name(filter.effect, 'PresLum')
        filter.params.graph = obs.gs_effect_get_param_by_name(filter.effect, 'graph')
        filter.params.width = obs.gs_effect_get_param_by_name(filter.effect, 'width')
        filter.params.height = obs.gs_effect_get_param_by_name(filter.effect, 'height')
		--filter.params.time = obs.gs_effect_get_param_by_name(filter.effect, 'time')
	end
    obs.obs_leave_graphics()


    if filter.effect == nil then
        source_info.destroy(filter)
        return nil
    end

    source_info.update(filter, settings)
    return filter
end

source_info.destroy = function(filter)
    if filter.effect ~= nil then
        obs.obs_enter_graphics()
        obs.gs_effect_destroy(filter.effect)
		--filter.effect = nil
        obs.obs_leave_graphics()
    end
	filter = nil
end

source_info.get_width = function(filter)
    return filter.width
end

source_info.get_height = function(filter)
    return filter.height
end

source_info.get_properties = function(settings)
    props = obs.obs_properties_create()

    obs.obs_properties_add_bool(props, SETTING_graph, TEXT_graph)
    obs.obs_properties_add_bool(props, SETTING_PresLum, TEXT_PresLum)
    obs.obs_properties_add_float_slider(props, SETTING_HighP, TEXT_HighP, 161.0, 254.0, 1.0)
    obs.obs_properties_add_float_slider(props, SETTING_HighR, TEXT_HighR, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_HighG, TEXT_HighG, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_HighB, TEXT_HighB, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_MidP, TEXT_MidP, 97.0, 160.0, 1.0)
    obs.obs_properties_add_float_slider(props, SETTING_MidR, TEXT_MidR, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_MidG, TEXT_MidG, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_MidB, TEXT_MidB, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_ShadP, TEXT_ShadP, 1.0, 96.0, 1.0)
    obs.obs_properties_add_float_slider(props, SETTING_ShadR, TEXT_ShadR, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_ShadG, TEXT_ShadG, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_ShadB, TEXT_ShadB, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_SAT, TEXT_SAT, 0.0, 1.0, 0.001)

    return props
end

source_info.get_defaults = function(settings)
    obs.obs_data_set_default_double(settings, SETTING_ShadR, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_ShadG, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_ShadB, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_ShadP, 64.0)
    obs.obs_data_set_default_double(settings, SETTING_MidR, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_MidG, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_MidB, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_MidP, 128.0)
    obs.obs_data_set_default_double(settings, SETTING_HighR, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_HighG, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_HighB, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_HighP, 192.0)
    obs.obs_data_set_default_double(settings, SETTING_SAT, 1.0)
    obs.obs_data_set_default_bool(settings, SETTING_PresLum, false)
    obs.obs_data_set_default_bool(settings, SETTING_graph, false)
end

source_info.update = function(filter, settings)
    filter.ShadR = obs.obs_data_get_double(settings, SETTING_ShadR)
    filter.ShadG = obs.obs_data_get_double(settings, SETTING_ShadG)
    filter.ShadB = obs.obs_data_get_double(settings, SETTING_ShadB)
    filter.ShadP = obs.obs_data_get_double(settings, SETTING_ShadP)
    filter.MidR = obs.obs_data_get_double(settings, SETTING_MidR)
    filter.MidG = obs.obs_data_get_double(settings, SETTING_MidG)
    filter.MidB = obs.obs_data_get_double(settings, SETTING_MidB)
    filter.MidP = obs.obs_data_get_double(settings, SETTING_MidP)
    filter.HighR = obs.obs_data_get_double(settings, SETTING_HighR)
    filter.HighG = obs.obs_data_get_double(settings, SETTING_HighG)
    filter.HighB = obs.obs_data_get_double(settings, SETTING_HighB)
    filter.HighP = obs.obs_data_get_double(settings, SETTING_HighP)
    filter.SAT = obs.obs_data_get_double(settings, SETTING_SAT)
    filter.PresLum = obs.obs_data_get_bool(settings, SETTING_PresLum)
    filter.graph = obs.obs_data_get_bool(settings, SETTING_graph)

	--filter.settings = settings

	set_render_size(filter)

end

source_info.video_render = function(filter)

  if not obs.obs_source_process_filter_begin(filter.source, obs.GS_RGBA, obs.OBS_NO_DIRECT_RENDERING) then
	obs.obs_source_skip_video_filter(filter.source)
	return
  end

  --local parent = obs.obs_filter_get_parent(filter.source)
  --filter.width = obs.obs_source_get_base_width(parent)
  --filter.height = obs.obs_source_get_base_height(parent)
  --filter.time = os.clock()


    obs.gs_effect_set_float(filter.params.ShadR, filter.ShadR)
    obs.gs_effect_set_float(filter.params.ShadG, filter.ShadG)
    obs.gs_effect_set_float(filter.params.ShadB, filter.ShadB)
    obs.gs_effect_set_float(filter.params.ShadP, filter.ShadP)
    obs.gs_effect_set_float(filter.params.MidR, filter.MidR)
    obs.gs_effect_set_float(filter.params.MidG, filter.MidG)
    obs.gs_effect_set_float(filter.params.MidB, filter.MidB)
    obs.gs_effect_set_float(filter.params.MidP, filter.MidP)
    obs.gs_effect_set_float(filter.params.HighR, filter.HighR)
    obs.gs_effect_set_float(filter.params.HighG, filter.HighG)
    obs.gs_effect_set_float(filter.params.HighB, filter.HighB)
    obs.gs_effect_set_float(filter.params.HighP, filter.HighP)
    obs.gs_effect_set_float(filter.params.SAT, filter.SAT)
    obs.gs_effect_set_bool(filter.params.PresLum, filter.PresLum)
    obs.gs_effect_set_bool(filter.params.graph, filter.graph)
	obs.gs_effect_set_int(filter.params.width, filter.width)
	obs.gs_effect_set_int(filter.params.height, filter.height)
    --obs.gs_effect_set_float(filter.params.time, filter.time)

	obs.gs_blend_state_push()
	obs.gs_blend_function(obs.GS_BLEND_ONE, obs.GS_BLEND_INVSRCALPHA)
    obs.obs_source_process_filter_end(filter.source, filter.effect, filter.width, filter.height)
	obs.gs_blend_state_pop()
end

source_info.video_tick = function(filter, seconds)
    set_render_size(filter)
end

--obs.obs_register_source(source_info)

shader = [[
uniform float4x4 ViewProj;
uniform texture2d image;

uniform float ShadR;
uniform float ShadG;
uniform float ShadB;
uniform float ShadP;
uniform float MidR;
uniform float MidG;
uniform float MidB;
uniform float MidP;
uniform float HighR;
uniform float HighG;
uniform float HighB;
uniform float HighP;
uniform float SAT;
uniform bool PresLum;
uniform bool graph;
uniform int width;
uniform int height;

sampler_state textureSampler {
    Filter    = Linear;
    AddressU  = Clamp;
    AddressV  = Clamp;
};

struct VertDataIn {
    float4 pos : POSITION;
    float2 uv  : TEXCOORD0;
};

struct VertDataOut {
    float4 pos : POSITION;
    float2 uv  : TEXCOORD0;
};

VertDataOut VSDefault(VertDataIn v_in)
{
    VertDataOut vert_out;
    vert_out.pos = mul(float4(v_in.pos.xyz, 1.0), ViewProj);
    vert_out.uv  = v_in.uv;
    return vert_out;
}

float rgb_to_sat( float r, float g, float b)
{
float sat = 0.0f;
float mini = min(min(r, g), b);
float maxi = max(max(r, g), b);
float delta = maxi - mini;
if (maxi != 0.0f) sat = delta / maxi;
return sat;
}

float interpolateCubicHermite(float x, float3 xbp, float3 ybp) {
	float ax[5]; // = {0.0, xbp.x, xbp.y, xbp.z, 1.0};
	ax[0] = 0.0;
	ax[1] = xbp.x;
	ax[2] = xbp.y;
	ax[3] = xbp.z;
	ax[4] = 1.0;
	float ay[5]; // = {0.0, ybp.x, ybp.y, ybp.z, 0.0};
	ay[0] = 0.0;
	ay[1] = ybp.x;
	ay[2] = ybp.y;
	ay[3] = ybp.z;
	ay[4] = 0.0;
	float m[5];
	float delta[4];
	int k;

	for (k = 0; k < 4; k++) {
		float deltak = (ay[k+1] - ay[k]) / (ax[k+1] - ax[k]);
		delta[k] = deltak;
		if (k == 0) {
			m[k] = deltak;
		} else {
		float p = ((ax[k+1] - ax[k]) * delta[k-1] + (ax[k] - ax[k-1]) * deltak) / (ax[k+1] - ax[k-1]);
		m[k] = (sign(delta[k-1]) + sign(deltak)) * min(abs(delta[k-1]), min(abs(deltak), 0.5 * abs(p)));
		}
	}
	m[4] = delta[3];

	float c[4];
	float d[4];
	float xdiff;
	for (k=0; k < 4; k++) {
		xdiff = ax[k+1] - ax[k];
		c[k] = (3.0*delta[k] - 2.0*m[k] - m[k+1]) / xdiff;
		d[k] = (m[k] + m[k+1] - 2.0*delta[k]) / xdiff / xdiff;
	}
	k = 0;
	if (x >= ax[1] && x < ax[2]) k = 1;
	if (x >= ax[2] && x < ax[3]) k = 2;
	if (x >= ax[3] && x < ax[4]) k = 3;
	if (x >= ax[4]) k = 4;
	xdiff = x - ax[k];
	return ay[k] + m[k] * xdiff + c[k] * xdiff * xdiff + d[k] * xdiff * xdiff * xdiff;
}

float4 PassThrough(VertDataOut v_in) : TARGET
{

float4 rgba = image.Sample(textureSampler, v_in.uv);
float iwidth = float(width);
float iheight = float(height);
float pixX = 1.0 / iwidth;
float pixY = 1.0 / iheight;
float X = v_in.uv.x;
float Y = v_in.uv.y;
Y = 1.0 - Y;

float Sat = rgb_to_sat(rgba.r, rgba.g, rgba.b);
float lumaIn = (rgba.r + rgba.g + rgba.b) / 3.0f;
float3 RGB = float3(rgba.r, rgba.g, rgba.b);
float3 RGB1 = float3(X, X, X);

float L_Shad = ShadP / 255.0;
float L_Mid = MidP / 255.0;
float L_High = HighP / 255;

float3 parrayX = float3(L_Shad, L_Mid, L_High);
float3 rarY = float3(ShadR, MidR, HighR);
float3 garY = float3(ShadG, MidG, HighG);
float3 barY = float3(ShadB, MidB, HighB);

float3 COLR;
COLR.r = interpolateCubicHermite(RGB.r, parrayX, rarY);
COLR.g = interpolateCubicHermite(RGB.g, parrayX, garY);
COLR.b = interpolateCubicHermite(RGB.b, parrayX, barY);

float3 COLR1;
COLR1.r = interpolateCubicHermite(X, parrayX, rarY);
COLR1.g = interpolateCubicHermite(X, parrayX, garY);
COLR1.b = interpolateCubicHermite(X, parrayX, barY);

RGB = COLR + RGB;
RGB.rgb = saturate(RGB.rgb);

RGB1 = COLR1;
RGB = Sat <= SAT ? RGB : float3(rgba.r, rgba.g, rgba.b);

if(PresLum) {
	float lumaOut = (RGB.r + RGB.g + RGB.b) / 3.0;
	float lumaDiff = lumaIn / lumaOut;
	if(lumaIn > 0.0f && lumaOut > 0.0f) RGB.rgb = RGB.rgb * lumaDiff;
}

if (graph) {
	float3 Graph = float3(0.0, 0.0, 0.0);
	float overlayR, overlayG, overlayB;
	overlayR = COLR1.r + 0.5 >= (Y - pixY) && COLR1.r + 0.5 <= (Y + pixY) ? 1.0f : 0.0f;
	overlayG = COLR1.g + 0.5 >= (Y - pixY) && COLR1.g + 0.5 <= (Y + pixY) ? 1.0f : 0.0f;
	overlayB = COLR1.b + 0.5 >= (Y - pixY) && COLR1.b + 0.5 <= (Y + pixY) ? 1.0f : 0.0f;
	Graph = float3(overlayR, overlayG, overlayB);
	RGB = lerp(RGB.rgb, Graph, max(overlayR, max(overlayG, overlayB)));
}

return float4(RGB, rgba.a);
}

technique Draw
{
    pass
    {
        vertex_shader = VSDefault(v_in);
        pixel_shader  = PassThrough(v_in);
    }

}
]]
